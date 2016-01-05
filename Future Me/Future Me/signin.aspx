<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" ng-app="myApp">
<head runat="server">
    <!--#include file="header.html"-->
    <%@ Page Language="C#" AutoEventWireup="true" CodeBehind="signin.aspx.cs" Inherits="Future_Me.signin" %>
    <title>Email2Future</title>
</head>

<body>
    <form id="myForm" name="myForm" runat="server">
        <!--#include file="topbar.html"-->
        <div class="container">
            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 text-center">
                <div id="banner">
                    <h1>
                        Send emails to yourself or your friends/family in the future
                    </h1>
                </div>
            </div>
            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                <div class="registrationform">
                    <div class="form-horizontal">
                        <fieldset>
                            <legend>Sign in<i class="fa fa-pencil pull-right"></i></legend>
                            <div class="form-group">
                                <asp:Label ID="Label6" runat="server" Text="Email" CssClass="col-lg-2 control-label"></asp:Label>
                                <div class="col-lg-10">
                                    <asp:TextBox ID="email" name="email" runat="server" placeholder="Email" CssClass="form-control" required></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <asp:Label ID="Label7" runat="server" Text="Password" CssClass="col-lg-2 control-label"></asp:Label>
                                <div class="col-lg-10">
                                    <asp:TextBox ID="pw1" name="pw1" runat="server" placeholder="Password" CssClass="form-control" TextMode="Password"
                                                 ng-model="pw1" required></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-lg-10 col-lg-offset-2">
                                    <asp:Button ID="Button1" type="submit" runat="server" CssClass="btn btn-primary" Text="Submit" />
                                    <asp:Button ID="Button2" runat="server" CssClass="btn btn-warning" Text="Cancel" />
                                </div>
                            </div>
                        </fieldset>
                    </div>
                </div>
            </div>
        </div>
        <!--#include file="footer.html"-->
        <script type="text/javascript">
            $("#myForm").submit(function (e) {
                var _IDUser = 1;
                // get id user if is login
                //var _IDUser = ;
                var _email = $('#email').val();
                var _password = $('#pw1').val();

                var url = "signIn"; // the script where you handle the form input.

                $.ajax({
                    type: "POST",
                    url: url,
                    data: { Email: _email, Password: _password}, // serializes the form's elements.
                    success: function (data) {
                        <%-- <% FormsAuthentication.RedirectFromLoginPage("a", false);%> // show response from the php script.--%>
                        alert("Sign in succeed!");
                    },
                    error: function (error) {
                        alert("Sign in failed!");
                    }
                });

                e.preventDefault(); // avoid to execute the actual submit of the form.
            });
        </script>
    </form>
</body>
</html>
