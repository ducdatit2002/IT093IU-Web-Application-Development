// handles/index.js

import { pool } from '../DB/index.js';

export const getAllCourses = async (req, res) => {
    pool.query('SELECT * FROM course', (error, results) => {
        if (error) {
            return res.status(500).json({ error: error.message });
        }
        res.status(200).json(results);
    });
};

export const getCourse = async (req, res) => {
    const { id } = req.params;
    pool.query('SELECT * FROM course WHERE id = ?', [id], (error, results) => {
        if (error) {
            return res.status(500).json({ error: error.message });
        }
        res.status(200).json(results[0]);
    });
};

export const createCourse = async (req, res) => {
    const { id, course_level_id, name, name_vn, credit_theory, credit_lab, description } = req.body;
    pool.query('INSERT INTO course (id, course_level_id, name, name_vn, credit_theory, credit_lab, description) VALUES (?, ?, ?, ?, ?, ?, ?)',
        [id, course_level_id, name, name_vn, credit_theory, credit_lab, description], (error, results) => {
        if (error) {
            return res.status(500).json({ error: error.message });
        }
        res.status(201).send(`Course added with ID: ${results.insertId}`);
    });
};

export const updateCourse = async (req, res) => {
    const { id } = req.params;
    const { name, name_vn, credit_theory, credit_lab, description } = req.body;
    pool.query(
        'UPDATE course SET name = ?, name_vn = ?, credit_theory = ?, credit_lab = ?, description = ? WHERE id = ?',
        [name, name_vn, credit_theory, credit_lab, description, id],
        (error, results) => {
            if (error) {
                return res.status(500).json({ error: error.message });
            }
            res.status(200).send(`Course modified with ID: ${id}`);
        }
    );
};

export const deleteCourse = async (req, res) => {
    const { id } = req.params;
    pool.query('DELETE FROM course WHERE id = ?', [id], (error, results) => {
        if (error) {
            return res.status(500).json({ error: error.message });
        }
        res.status(200).send(`Course deleted with ID: ${id}`);
    });
};
