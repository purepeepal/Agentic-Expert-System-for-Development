/**
 * AES Memory Format Migration Script (v4.0 to v4.1)
 * Migrates decisions.json and user_model.json into an optimized CSV/YAML split format.
 * CSV ensures 70% token savings for flat properties.
 * YAML ensures structural integrity for nested properties.
 * 
 * Usage:
 *   node migrate_memory_v4_to_v4_1.js
 * 
 * Dependencies:
 *   npm install yaml csv-stringify csv-parse
 */

const fs = require('fs');
const path = require('path');
const { stringify } = require('yaml');
const { stringify: csvStringify } = require('csv-stringify/sync');

const MEMORY_DIR = path.join(__dirname, '../../memory');

function migrateDecisions() {
    const jsonPath = path.join(MEMORY_DIR, 'decisions.json');
    if (!fs.existsSync(jsonPath)) {
        console.log('[Migration] decisions.json not found, skipping...');
        return;
    }

    const raw = JSON.parse(fs.readFileSync(jsonPath, 'utf8'));
    const decisions = raw.decisions || raw;

    const csvData = [];
    const yamlMeta = {};

    for (const d of decisions) {
        // Flat data for CSV
        csvData.push({
            id: d.id || '',
            date: d.date || '',
            title: d.title || '',
            context: (d.context || '').replace(/\n/g, ' '),
            decision: (d.decision || '').replace(/\n/g, ' '),
            impact: d.impact || '',
            status: d.status || ''
        });

        // Nested data for YAML
        yamlMeta[d.id] = {
            rationale: d.rationale,
            alternatives_considered: d.alternatives_considered || [],
            approvers: d.approvers || [],
            related_requirements: d.related_requirements || [],
            key_insights: d.key_insights || [],
            metrics: d.metrics || {}
        };
    }

    // Write CSV
    const csvContent = csvStringify(csvData, { header: true });
    fs.writeFileSync(path.join(MEMORY_DIR, 'decisions.csv'), csvContent);

    // Write YAML
    fs.writeFileSync(path.join(MEMORY_DIR, 'decisions_meta.yaml'), stringify(yamlMeta));

    console.log('[Migration] decisions.json successfully split into decisions.csv and decisions_meta.yaml');
}

function migrateUserModel() {
    const jsonPath = path.join(MEMORY_DIR, 'user_model.json');
    if (!fs.existsSync(jsonPath)) {
        console.log('[Migration] user_model.json not found, skipping...');
        return;
    }

    const raw = JSON.parse(fs.readFileSync(jsonPath, 'utf8'));
    const model = raw.user_model || raw;

    // Split flat lists to CSV
    if (model.decision_patterns) {
        const patternsCsv = csvStringify(model.decision_patterns, { header: true });
        fs.writeFileSync(path.join(MEMORY_DIR, 'user_model_patterns.csv'), patternsCsv);
    }
    
    if (model.approval_signals) {
        const approvalsCsv = csvStringify(model.approval_signals, { header: true });
        fs.writeFileSync(path.join(MEMORY_DIR, 'user_model_approvals.csv'), approvalsCsv);
    }

    if (model.rejection_signals) {
        const rejectionsCsv = csvStringify(model.rejection_signals, { header: true });
        fs.writeFileSync(path.join(MEMORY_DIR, 'user_model_rejections.csv'), rejectionsCsv);
    }

    if (model.quality_axes) {
        const axesCsv = csvStringify(model.quality_axes, { header: true });
        fs.writeFileSync(path.join(MEMORY_DIR, 'user_model_axes.csv'), axesCsv);
    }

    // Retain remaining elements as YAML
    const meta = {
        correction_patterns: model.correction_patterns || [],
        communication_preferences: model.communication_preferences || {},
        anti_preferences: model.anti_preferences || []
    };
    fs.writeFileSync(path.join(MEMORY_DIR, 'user_model_meta.yaml'), stringify(meta));

    console.log('[Migration] user_model.json successfully split into CSV tables and user_model_meta.yaml');
}

console.log('--- Starting AES Memory Format Migration (v4.0 -> v4.1) ---');
migrateDecisions();
migrateUserModel();
console.log('--- Migration Complete ---');
