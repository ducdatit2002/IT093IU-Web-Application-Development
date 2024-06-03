<%-- 
    Document   : Task2
    Created on : Mar 16, 2022, 10:50:21 AM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Task 2</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
    </head>
    <body>
        <div class="container">
            <div class="alert alert-success" role="alert">
                <h4 class="alert-heading" style="text-align: center">Task 2 || Lab 2 || Web Application Development</h4>
                <p style="text-align: center" >ITITIU19169</p>
            </div>
            <div class="row">
                <div class="col">
                    <div class="alert alert-dark" role="alert">
                        <h1 style="text-align: center">MY RESUME</h1>
                        <h6 style="text-align: center">Contact for building Web project</h6>
                        <div class="form">
                            <form method="post" action="getContact.jsp">
                                <div class="container">
                                    <div class="row">
                                        <div class="col-sm">Name:* <input class="form-control" type="text" name="txt" required/></div>
                                        <div class="col-sm">Email:* <input class="form-control" type="email" name="email" required/> </div>
                                    </div>
                                    <br>
                                    <div class="row">
                                        <p>Mesage:</p>
                                        <textarea style="border: 2px solid #ccc; border-radius: 4px; background-color: #f8f8f8;" name="message" rows="3" cols="49">
                                        </textarea>
                                    </div>
                                    <br>
                                    <input class="form-control btn btn-success" type="submit" value="Send Message"/>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="col">
                    <div class="alert alert-dark" role="alert">
                        <h1 style="text-align: center">DECLARATION FORM</h1>
                        <h6 style="text-align: center">Make sure the information you declare must be true</h6>
                        <div class="form">
                            <div>
                                <form method="post" action="getDeclaration.jsp">
                                    Full name: <input class="form-control" type="text" name="txt" required/>
                                    <br>
                                    <br>
                                    Student's ID: <input class="form-control" type="text" name="id" required/>
                                    <br>
                                    <br>
                                    Email: <input class="form-control" type="text" name="email" required/>
                                    <br>
                                    <br>
                                    Gender: <input type="radio" name="gender" value="Male"/>Male
                                    <input type="radio" name="gender" value="Female"/>Female
                                    <br>
                                    <br>
                                    Major: <select class="btn btn-success dropdown-toggle" name="major">
                                        <option>IT</option>
                                        <option>BA</option>
                                        <option>EE</option>
                                        <option>BT</option>
                                    </select>
                                    <br>
                                    <br>
                                    Have you been positive with COVID-19?
                                    <input type="radio" name="contact" value="Yes"/> Yes
                                    <input type="radio" name="contact" value="No"/> No
                                    <br>
                                    <br>
                                    Have you been dosed any vaccine Covid 19?  <select class="btn btn-success dropdown-toggle" name="dose">
                                        <option>No dose</option>
                                        <option>1 dose</option>
                                        <option>2 dose</option>
                                        <option>3 advanced dose</option>
                                    </select>
                                    <br>
                                    <br>
                                    I pledge to provide accurate and factual information: <input type="radio" name="check" value="Confirm">Confirm
                                    <br>
                                    <br>
                                    <input class="form-control btn btn-success" type="submit" value="Submit"/>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
