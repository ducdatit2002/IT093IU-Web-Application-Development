// API.js
import axios from 'axios';

const API_URL = 'http://localhost:4000/api/v1/courses/courses';

export const getCourses = async () => {
  try {
    const response = await axios.get(API_URL);
    return response.data;
  } catch (error) {
    handleAxiosError(error);
  }
};

export const getCourseById = async (id) => {
  try {
    const response = await axios.get(`${API_URL}/${id}`);
    return response.data;
  } catch (error) {
    handleAxiosError(error);
  }
};

export const createCourse = async (course) => {
  try {
    const response = await axios.post(API_URL, course);
    return response.data;
  } catch (error) {
    handleAxiosError(error);
  }
};

export const updateCourse = async (id, course) => {
  try {
    const response = await axios.put(`${API_URL}/${id}`, course);
    return response.data;
  } catch (error) {
    handleAxiosError(error);
  }
};

export const deleteCourse = async (id) => {
  try {
    await axios.delete(`${API_URL}/${id}`);
  } catch (error) {
    handleAxiosError(error);
  }
};

// Helper function to handle Axios errors
const handleAxiosError = (error) => {
  if (error.response) {
    console.error('Backend responded with an error:', error.response.status, error.response.data);
  } else if (error.request) {
    console.error('No response received:', error.request);
  } else {
    console.error('Error setting up the request:', error.message);
  }
  throw error; // Re-throw the error if needed for further handling
};
