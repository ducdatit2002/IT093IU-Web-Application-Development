import React, { useState } from 'react';
import { useNavigate } from 'react-router-dom';
import axios from 'axios';
import { TextField, Button, Grid, Paper, Container } from '@mui/material';

function AddCourse() {
    const [courseData, setCourseData] = useState({
        id: '',
        course_level_id: '',
        name: '',
        name_vn: '',
        credit_theory: 0,
        credit_lab: 0,
        description: ''
    });
    const navigate = useNavigate();

    const handleChange = (e) => {
        setCourseData({ ...courseData, [e.target.name]: e.target.value });
    };

    const handleSubmit = async (event) => {
        event.preventDefault();
        try {
            await axios.post('http://localhost:4000/api/v1/courses/courses', courseData);
            navigate('/'); // Navigate back to the course list after successful addition
        } catch (error) {
            console.error('Error adding course:', error);
        }
    };

    return (
        <Container component="main" maxWidth="md">
            <Paper style={{ padding: '20px', marginTop: '20px' }}>
                <h1>Add New Course</h1>
                <form onSubmit={handleSubmit}>
                    <Grid container spacing={2}>
                        <Grid item xs={12} sm={6}>
                            <TextField
                                fullWidth
                                label="Course ID"
                                name="id"
                                value={courseData.id}
                                onChange={handleChange}
                                variant="outlined"
                            />
                        </Grid>
                        <Grid item xs={12} sm={6}>
                            <TextField
                                fullWidth
                                label="Course Level ID"
                                name="course_level_id"
                                type="number"
                                value={courseData.course_level_id}
                                onChange={handleChange}
                                variant="outlined"
                            />
                        </Grid>
                        <Grid item xs={12}>
                            <TextField
                                fullWidth
                                label="Name (EN)"
                                name="name"
                                value={courseData.name}
                                onChange={handleChange}
                                variant="outlined"
                            />
                        </Grid>
                        <Grid item xs={12}>
                            <TextField
                                fullWidth
                                label="Name (VN)"
                                name="name_vn"
                                value={courseData.name_vn}
                                onChange={handleChange}
                                variant="outlined"
                            />
                        </Grid>
                        <Grid item xs={6}>
                            <TextField
                                fullWidth
                                label="Theory Credits"
                                name="credit_theory"
                                type="number"
                                value={courseData.credit_theory}
                                onChange={handleChange}
                                variant="outlined"
                            />
                        </Grid>
                        <Grid item xs={6}>
                            <TextField
                                fullWidth
                                label="Lab Credits"
                                name="credit_lab"
                                type="number"
                                value={courseData.credit_lab}
                                onChange={handleChange}
                                variant="outlined"
                            />
                        </Grid>
                        <Grid item xs={12}>
                            <TextField
                                fullWidth
                                label="Description"
                                name="description"
                                value={courseData.description}
                                onChange={handleChange}
                                multiline
                                rows={4}
                                variant="outlined"
                            />
                        </Grid>
                        <Grid item xs={12}>
                            <Button type="submit" fullWidth variant="contained" color="primary">
                                Add Course
                            </Button>
                        </Grid>
                    </Grid>
                </form>
            </Paper>
        </Container>
    );
}

export default AddCourse;
