<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="Future_Me.index" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <!--#include file="header.aspx"-->
    
    <title>Email2Future</title>
</head>
<body>
    
    <form id="form1" runat="server">
    <!--#include file="topbar.aspx"-->
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
                        <legend>Send <i class="fa fa-pencil pull-right"></i></legend>
                        <div class="form-group">
                            <asp:Label ID="Label1" runat="server" Text="To Email" CssClass="col-lg-2 control-label"></asp:Label>
                            <div class="col-lg-10">
                                <asp:TextBox ID="tbEmail" runat="server" placeholder="Email" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <asp:Label ID="Label2" runat="server" Text="Subject" CssClass="col-lg-2 control-label"></asp:Label>
                            <div class="col-lg-10">
                                <asp:TextBox ID="tbSubject" runat="server" placeholder="Subject" CssClass="form-control"
                                    ></asp:TextBox>
                            </div>
                        </div>

                        <div class="form-group">
                            <asp:Label ID="Label6" runat="server" Text="Your Letter" CssClass="col-lg-2 control-label"></asp:Label>
                            <div class="col-lg-10">
                                <asp:TextBox ID="tbLetter" runat="server" Text="Dear me in Future," CssClass="form-control" Rows="3" TextMode="MultiLine"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group">
                            <asp:Label ID="Label3" runat="server" Text="On date" CssClass="col-lg-2 control-label"></asp:Label>
                            <div class="col-lg-10">
                                <asp:TextBox ID="txtDate" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-lg-10 col-lg-offset-2">
                                <asp:Button ID="btnSubmit" runat="server" CssClass="btn btn-primary" Text="Submit"/>
                                  <asp:Button ID="btnCancel" runat="server" CssClass="btn btn-warning" Text="Cancel" />                              
                            </div>
                        </div>
                    </fieldset>
                </div>
            </div>
        </div>
    </div>
    <!--#include file="footer.aspx"-->
    <script type="text/javascript">
        $("#form1").submit(function (e) {
            var _IDUser = 1;
            // get id user if is login
            //var _IDUser = ;
            var _email = $('#tbEmail').val();
            var _Subject = $('#tbSubject').val();
            var _Letter = $('#tbLetter').val();
            var _DeliverOn = $('#txtDate').val();

            var url = "addEmail"; // the script where you handle the form input.

            $.ajax({
                type: "POST",
                url: url,
                data: { IDUser: _IDUser, EmailTo: _email, Subject: _Subject, Letter: _Letter, DeliverOn: _DeliverOn }, // serializes the form's elements.
                success: function (data) {
                    alert("A letter is stored!"); // show response from the php script.
                },
                error: function (error) {
                    alert("Error: Can not store you letter!");
                }
            });

            e.preventDefault(); // avoid to execute the actual submit of the form.
        });
    </script>
    <script type="text/javascript">
        $(function () {
            $("#txtDate").datepicker({
                changeMonth: true,
                changeYear: true,
            });
        });
    </script>
    </form>
</body>

</html>

