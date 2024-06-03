const mongodb = require('../config/mongodb');
const student = 'students';
const course = 'courses';

const login = async(req, res) => {
    try {

        const id = await req.body.username;
        const pass = await req.body.password;

        const db = await mongodb.getDB();

        const result = await db.collection(student).findOne({ studentID: req.body.username });

        if (result) {
            if (result.studentPass === req.body.password) {
                res.send({
                    status: "success",
                    message: "Login success",
                    result: result,
                });
            } else {
                res.send({
                    status: "fail",
                    message: "Wrong password",
                });
            }
        } else {
            res.send({
                status: "fail",
                message: "No account exist",
            });
        }
    } catch (error) {
        console.error('LoginController', error);
    }

}

const registeredCourse = async(req, res) => {
    try {
        const id = req.params.id;
        const db = await mongodb.getDB();
        const result = await db.collection(student).findOne({ studentID: id });
        const course1 = await db.collection(course).find({ c_ID: { $in: result.courseID } }).toArray();
        // console.log(course1)
        const course2 = await db.collection(course).find({ c_ID: { $ne: result.courseID } }).toArray();
        // console.log(course2)

        if (result) {
            res.send({
                status: "success",
                message: "Get registered courses success",
                result: course1,
                result2: course2,
            });
        } else {
            res.send({
                status: "fail",
                message: "Get registered courses fail",
            });
        }
    } catch (error) {
        console.error('registerdCourse', error);
    }
}

const registerCourse = async(req, res) => {
    try {
        const id = req.params.id;
        const courseID = req.body.courseID;
        const db = await mongodb.getDB();
        const result = await db.collection(student).findOne({ studentID: id });
        const course1 = await db.collection(course).findOne({ c_ID: courseID });
        if (result) {
            if (result.courseID.indexOf(courseID) === -1) {
                result.courseID.push(courseID);
                await db.collection(student).updateOne({ studentID: id }, { $set: { courseID: result.courseID } });
                res.send({
                    status: "success",
                    message: "Register course success",
                    result: result,
                });
            } else {
                res.send({
                    status: "fail",
                    message: "You have already registered this course",
                });
            }
        } else {
            res.send({
                status: "fail",
                message: "Register course fail",
            });
        }
    } catch (error) {
        console.error('registerCourse', error);
    }
}

module.exports = { login, registeredCourse, registerCourse };