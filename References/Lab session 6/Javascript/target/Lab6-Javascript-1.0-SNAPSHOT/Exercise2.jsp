<%-- 
    Document   : Exercise2
    Created on : May 3, 2022, 12:28:49 PM
    Author     : asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Exercise 2</title>
    </head>
    <body>
        <div style="text-align:center">
            <button type="button" id="startBtn" onclick="startCountDown()">Start counting down 1:00 [mm:ss]</button>
            <hr>
        </div>

        <div style="text-align:center" id="content">
            <form method="GET">

                <div id="questionField">
                    <h3>These are test question</h3>
                    <table  style="padding-left: 35%; padding-right: 35%">
                        <tr>
                            <td>Question 1: How many people are there in your class?</td>
                            <td colspan="2"><input type="text" name="question1"/></td>
                        </tr>
                        <tr>
                            <td>Question 2: How do you feel now?</td>
                            <td><input type="radio" name="question2"/>Good</td>
                            <td><input type="radio" name="question2"/>Bad</td>
                        </tr>
                    </table>
                </div>

                <div id="submitField" style="display: none">
                    <h3>Time is up</h3>
                    <input type="submit" name="submit" value="Submit your answer"/>
                </div>
            </form>
        </div>
        
        <script type="text/javascript">
            var startBtn = document.getElementById('startBtn');
            var content = document.getElementById('content');
            var questionField = document.getElementById('questionField');
            var submitField = document.getElementById('submitField');

            var timeRemain = 60;

            const startCountDown = () => {
                content.style.display = 'block';
                let refreshBtn = setInterval(() => {
                    const mmss = (new Date(timeRemain * 1000)).toISOString().substr(14, 5);
                    startBtn.innerHTML = `The remaining time: ${mmss} [mm:ss]`;
                    if (timeRemain === 0) {
                        clearInterval(refreshBtn);
                        questionField.style.display = 'none';
                        submitField.style.display = 'block';
                        startBtn.style.display = 'none';
                    }

                    timeRemain -= 1;
                }, 1000);
            };
        </script>
    </body>
</html>
