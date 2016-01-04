<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" ng-app="myApp">
<head runat="server">
    <!--#include file="header.html"-->
    <%@ Page Language="C#" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="Future_Me.register" %>
    <title>Email2Future</title>
</head>

<body>
    <form id="myForm" name="myForm" runat="server">
    <!--#include file="topbar.html"-->
    <div class="container">
        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 text-center">
            <div id="banner">
                <h1>
                    Send emails to yourself or your friends/family in the future</h1>
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
                                <asp:TextBox ID="email" name="email" runat="server" placeholder="Email" CssClass="form-control" required></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group">
                            <asp:Label ID="Label7" runat="server" Text="Password" CssClass="col-lg-2 control-label"></asp:Label>
                            <div class="col-lg-10">
                                <asp:TextBox ID="pw1" name="pw1" runat="server" placeholder="Password" CssClass="form-control" TextMode="Password" 
                                    ng-model="pw1" required
                                    ></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group">
                            <asp:Label ID="Label8" runat="server" Text="Re-type Password" CssClass="col-lg-2 control-label"></asp:Label>
                            <div class="col-lg-10">
                                <asp:TextBox ID="pw2" name="pw2" runat="server" placeholder="Re-type Password" CssClass="form-control" TextMode="Password"
                                    ng-model="pw2" pw-check="pw1" required
                                ></asp:TextBox>
                                <div class="msg-block" ng-show="isMatch"> 
                                    <span class="msg-error" ng-show="isMatch">Passwords don't match.</span> 
                                </div>
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
    </form>
</body>
</html>
