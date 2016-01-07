<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="Future_Me.register" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <!--#include file="header.aspx"-->
    <title>Email2Future</title>
</head>

<body ng-app="myApp" novalidate>
    <form id="myForm" name="myForm" runat="server">
        <div id="custom-bootstrap-menu" class="navbar navbar-default " role="navigation">
            <div class="container">
                <div class="navbar-header">
                    <a class="navbar-brand" href="index.aspx">Email2Future</a>
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-menubuilder">
                        <span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span>
                    </button>
                </div>
                <div class="collapse navbar-collapse navbar-menubuilder">
                    <ul class="nav navbar-nav navbar-right" id="topbar" runat="server">
                        <li><a href="/">Home</a> </li>
                        <li><a href="/manager.aspx" id="managerLink" runat="server">Your mail</a> </li>
                        <li><a href="/publicletters.aspx">Public letters</a> </li>
                        <li><a href="/register.aspx" id="signUplink" runat="server">Sign up</a> </li>
                        <li><a href="/signin.aspx" id="signInlink" runat="server">Sign in</a> </li>
                        <li><a href="/signout.aspx" onclick="signOut();" id="signOutlink" runat="server">Sign Out</a> </li>
                        <%--<li><a href="#" onclick="signOut();">Sign Out</a> </li>--%>
                    </ul>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 text-center">
                <div id="banner">
                    <h1>Send emails to yourself or your friends/family in the future</h1>
                </div>
            </div>
            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                <div class="registrationform">
                    <div class="form-horizontal">
                        <fieldset>
                            <legend>Registration Form <i class="fa fa-pencil pull-right"></i></legend>
                            <div class="form-group">
                                <asp:Label ID="Label6" runat="server" Text="Email" CssClass="col-lg-2 control-label"></asp:Label>
                                <div class="col-lg-10">
                                    <asp:TextBox ID="email" name="email" runat="server" placeholder="Email" CssClass="form-control" 
                                         ng-model="email" ng-minlength="5" ng-maxlength="50" TextMode="Email" required></asp:TextBox>
                                    <div ng-messages="myForm.email.$error" ng-if='myForm.email.$dirty'>
                                        <div ng-message="required">This field is required</div>
                                        <div ng-message="email">Your email address is invalid</div>
                                        <div ng-message="minlength">Your field is too short</div>
                                        <div ng-message="maxlength">Your field is too long</div>
                                    </div>
                                </div>
                                
                            </div>
                            <div class="form-group">
                                <asp:Label ID="Label7" runat="server" Text="Password" CssClass="col-lg-2 control-label"></asp:Label>
                                <div class="col-lg-10">
                                    <asp:TextBox ID="pw1" name="pw1" runat="server" placeholder="Password" CssClass="form-control" 
                                        TextMode="Password"
                                        ng-minlength="5" ng-maxlength="50" ng-pattern="/^([0-9]+[a-zA-Z]+|[a-zA-Z]+[0-9]+)[0-9a-zA-Z]*$/"
                                        ng-model="pw1" required></asp:TextBox>
                                    <div ng-messages="myForm.pw1.$error" ng-if='myForm.pw1.$dirty'>
                                        <div ng-message="required">This field is required</div>
                                        <div ng-message="minlength">Your field is too short</div>
                                        <div ng-message="maxlength">Your field is too long</div>
                                        <div ng-message="pattern">Must contain at least one digit and one letter</div>
                                    </div>
                                </div>
                                
                            </div>
                            <div class="form-group">
                                <asp:Label ID="Label8" runat="server" Text="Re-type Password" CssClass="col-lg-2 control-label"></asp:Label>
                                <div class="col-lg-10">
                                    <asp:TextBox ID="pw2" name="pw2" runat="server" placeholder="Re-type Password" CssClass="form-control" TextMode="Password"
                                        ng-model="pw2" ng-pattern="\b{{myForm.pw1.$viewValue}}\b" required></asp:TextBox>
                                    <div ng-messages="myForm.pw2.$error" ng-if='myForm.pw2.$dirty'>
                                        <div ng-message="required">This field is required</div>
                                        <div ng-message="pattern">Not equal!!!</div>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-lg-10 col-lg-offset-2">
                                    <asp:Button ID="Button1" type="submit" runat="server" CssClass="btn btn-primary" Text="Submit" ng-model="button" ng-disabled="myForm.pw1.$invalid || myForm.pw2.$invalid || myForm.email.$invalid"/>
                                    <asp:Button ID="btnCancel" runat="server" CssClass="btn btn-warning" Text="Cancel" UseSubmitBehavior="False" />
                                    <asp:Button ID="Button2" runat="server" CssClass="btn btn-warning" Text="Sign in with Google" UseSubmitBehavior="False" onclientclick="window.location.href='signin.aspx'; return false;"/>
                                    

                                </div>
                            </div>
                        </fieldset>
                    </div>
                </div>
            </div>
        </div>
        <!--#include file="footer.aspx"-->
        <script type="text/javascript">
            $("#myForm").one('submit', function (e) {
                $(this).find('input[type="submit"]').attr("disabled", true);
                $('#Button2').attr("disabled", true);
                // get id user if is login
                //var _IDUser = ;
                var _email = $('#email').val();
                var _password = $('#pw1').val();

                var url = "addUser"; // the script where you handle the form input.

                $.ajax({
                    type: "POST",
                    url: url,
                    data: { Email: _email, Password: _password }, // serializes the form's elements.
                    success: function (data) {
                        alert("Sign up succeed!"); // show response from the php script.
                        window.location.href = "signin.aspx";
                    },
                    error: function (error) {
                        alert("Sign up failed!");
                        $("#Button1").attr("disabled", false);
                        $('#Button2').attr("disabled", false);
                    }
                });

                e.preventDefault(); // avoid to execute the actual submit of the form.
            });
        </script>
        <script type="text/javascript">
            function redirect() {
                location.href = '/signin.aspx';
            }
        </script>
    </form>
</body>
</html>

