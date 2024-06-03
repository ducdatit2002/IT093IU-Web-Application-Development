// routes/index.js
import { Router } from "express";
import {
    createCourse,
    deleteCourse,
    getAllCourses,
    getCourse,
    updateCourse
} from "../handlers/index.js";

const appRouter = Router();

appRouter.get("/courses", getAllCourses);
appRouter.get("/courses/:id", getCourse);
appRouter.post("/courses", createCourse);
appRouter.put("/courses/:id", updateCourse);
appRouter.delete("/courses/:id", deleteCourse);

export default appRouter;
