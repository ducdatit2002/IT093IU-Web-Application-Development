import React, { useEffect, useState } from 'react';
import axios from 'axios';
import { useNavigate } from 'react-router-dom';
import { Table, TableBody, TableCell, TableContainer, TableHead, TableRow, Paper, IconButton, Button, Dialog, DialogActions, DialogContent, DialogContentText, DialogTitle } from '@mui/material';
import EditIcon from '@mui/icons-material/Edit';
import DeleteIcon from '@mui/icons-material/Delete';

function CourseList() {
    const [courses, setCourses] = useState([]);
    const [openDialog, setOpenDialog] = useState(false);
    const [courseToDelete, setCourseToDelete] = useState(null);
    const navigate = useNavigate();

    useEffect(() => {
        fetchCourses();
    }, []);

    const fetchCourses = async () => {
        try {
            const response = await axios.get('http://localhost:4000/api/v1/courses/courses');
            setCourses(response.data);
        } catch (error) {
            console.error('Error fetching courses:', error);
        }
    };

    const deleteCourse = async (id) => {
        try {
            await axios.delete(`http://localhost:4000/api/v1/courses/courses/${id}`);
            fetchCourses();  // Refresh the course list after deleting a course
            handleCloseDialog();  // Close the confirmation dialog
        } catch (error) {
            console.error('Error deleting course:', error);
        }
    };

    const handleOpenDialog = (course) => {
        setCourseToDelete(course);
        setOpenDialog(true);
    };

    const handleCloseDialog = () => {
        setOpenDialog(false);
    };

    return (
        <Paper sx={{ width: '100%', overflow: 'hidden' }}>
            <Button variant="contained" color="primary" onClick={() => navigate('/add')} style={{ margin: 16 }}>
                Add New Course
            </Button>
            <TableContainer component={Paper}>
                <Table aria-label="simple table">
                    <TableHead>
                        <TableRow>
                            <TableCell>ID</TableCell>
                            <TableCell>Name (EN)</TableCell>
                            <TableCell>Name (VN)</TableCell>
                            <TableCell>Theory Credits</TableCell>
                            <TableCell>Lab Credits</TableCell>
                            <TableCell>Description</TableCell>
                            <TableCell>Actions</TableCell>
                        </TableRow>
                    </TableHead>
                    <TableBody>
                        {courses.map((course) => (
                            <TableRow key={course.id}>
                                <TableCell component="th" scope="row">{course.id}</TableCell>
                                <TableCell>{course.name}</TableCell>
                                <TableCell>{course.name_vn}</TableCell>
                                <TableCell>{course.credit_theory}</TableCell>
                                <TableCell>{course.credit_lab}</TableCell>
                                <TableCell>{course.description}</TableCell>
                                <TableCell>
                                    <IconButton onClick={() => navigate(`/edit/${course.id}`)}><EditIcon color="primary" /></IconButton>
                                    <IconButton onClick={() => handleOpenDialog(course)}><DeleteIcon color="secondary" /></IconButton>
                                </TableCell>
                            </TableRow>
                        ))}
                    </TableBody>
                </Table>
            </TableContainer>
            {courseToDelete && (
                <Dialog
                    open={openDialog}
                    onClose={handleCloseDialog}
                    aria-labelledby="alert-dialog-title"
                    aria-describedby="alert-dialog-description"
                >
                    <DialogTitle id="alert-dialog-title">{"Confirm Deletion"}</DialogTitle>
                    <DialogContent>
                        <DialogContentText id="alert-dialog-description">
                            Are you sure you want to delete the course: {courseToDelete.name}?
                        </DialogContentText>
                    </DialogContent>
                    <DialogActions>
                        <Button onClick={handleCloseDialog} color="primary">
                            Cancel
                        </Button>
                        <Button onClick={() => deleteCourse(courseToDelete.id)} color="primary" autoFocus>
                            Delete
                        </Button>
                    </DialogActions>
                </Dialog>
            )}
        </Paper>
    );
}

export default CourseList;
