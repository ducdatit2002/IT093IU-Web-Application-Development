import React from 'react';
import { Route, Routes } from 'react-router-dom';
import CourseList from './Course/CourseList';
import AddCourse from './Course/AddCourse';
import EditCourse from './Course/EditCourse';

function App() {
    return (
        <div className="App">
            <h1>Course Management System</h1>
            <Routes>
                <Route path="/" element={<CourseList />} />
                <Route path="/add" element={<AddCourse />} />
                <Route path="/edit/:id" element={<EditCourse />} />
            </Routes>
        </div>
    );
}

export default App;
