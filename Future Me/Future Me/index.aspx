<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" ng-app="myApp">
<head runat="server">
    <!--#include file="header.html"-->
    <title>Email2Future</title>
</head>
<body>
    <form id="form1" runat="server">
        <!--#include file="topbar.html"-->
        <div class="container">
            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 text-center">
                <div id="banner">
                    <h1>
                        Bootstrap <strong>Registration Form</strong> for .net developers</h1>
                    <h5>
                        <strong>aspxtemplates.com</strong></h5>
                </div>
            </div>
            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                <div class="registrationform">
                    <div class="form-horizontal">
                        <fieldset>
                            <legend>Send <i class="fa fa-pencil pull-right"></i></legend>
                            <div class="form-group">
                                <asp:Label ID="Label1" runat="server" Text="To Email" CssClass="col-lg-2 control-label"></asp:Label>
                                <div class="col-lg-10">
                                    <asp:TextBox ID="TextBox1" runat="server" placeholder="Email" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <asp:Label ID="Label2" runat="server" Text="Subject" CssClass="col-lg-2 control-label"></asp:Label>
                                <div class="col-lg-10">
                                    <asp:TextBox ID="TextBox2" runat="server" placeholder="Subject" CssClass="form-control"
                                        ></asp:TextBox>
                                    <div class="checkbox">
                                        <label>
                                            <asp:CheckBox ID="CheckBox1" runat="server" Text="Remember Me" />
                                        </label>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <asp:Label ID="Label3" runat="server" Text="Address" CssClass="col-lg-2 control-label"></asp:Label>
                                <div class="col-lg-10">
                                    <asp:TextBox ID="TextBox3" runat="server" TextMode="MultiLine" Rows="3" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <asp:Label ID="Label4" runat="server" Text="Gender" CssClass="col-lg-2 control-label"></asp:Label>
                                <div class="col-lg-10">
                                    <div class="radio">
                                        <label>
                                            <asp:RadioButtonList ID="RadioButtonList1" runat="server">
                                                <asp:ListItem Selected="True">Male</asp:ListItem>
                                                <asp:ListItem>Female</asp:ListItem>
                                            </asp:RadioButtonList>
                                        </label>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                              <asp:Label ID="Label5" runat="server" Text="Country" CssClass="col-lg-2 control-label"></asp:Label>                          
                                <div class="col-lg-10">
                                    <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control ddl">
                                        <asp:ListItem>INDIA</asp:ListItem>
                                        <asp:ListItem>USA</asp:ListItem>
                                        <asp:ListItem>UK</asp:ListItem>
                                    </asp:DropDownList>                              
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-lg-10 col-lg-offset-2">
                                    <asp:Button ID="btnSubmit" runat="server" CssClass="btn btn-primary" Text="Submit" />
                                      <asp:Button ID="btnCancel" runat="server" CssClass="btn btn-warning" Text="Cancel" />                              
                                </div>
                            </div>
                        </fieldset>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
<footer>
    <!--#include file="footer.html"-->
</footer>
</html>
