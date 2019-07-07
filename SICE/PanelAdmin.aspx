<%@ Page Title="Panel de administrador" MasterPageFile="~/Site.Master" Language="C#" AutoEventWireup="true" CodeBehind="PanelAdmin.aspx.cs" Inherits="SICE.PanelAdmin" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="col-md-12" >
      <h1>Panel de administración</h1>
              <br />
        <h2>Usuarios</h2>
                   <div id="LArCon" class="card-body scroll" style="max-height: 550px!important;">
                    <table class="table table-hover" id="tablaConsumo">
                       <tr>
                           <th scope="col">
                               <h3>Nombre</h3><br />
                           &nbsp;<asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1">
                                   <ItemTemplate>     
                                       <asp:Label ID="UserNameLabel" runat="server" Text='<%# Eval("UserName") %>' />
                                       <br />
                                       <br />
                                   </ItemTemplate>
                               </asp:DataList>
                           </th>
                           <th scope="col">
                               <h3>Correo</h3>
                               <br />
                               <br />
                               <asp:DataList ID="DataList2" runat="server" DataSourceID="SqlDataSource2">
                                   <ItemTemplate>           
                                       <asp:Label ID="EmailLabel" runat="server" Text='<%# Eval("Email") %>' />
                                       <br />
                                       <br />
                                   </ItemTemplate>
                               </asp:DataList>
                               <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [Email] FROM [AspNetUsers]"></asp:SqlDataSource>
                           </th>
                       </tr>
                        </div>
                   </table>
               </div>
    <br/>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [UserName] FROM [AspNetUsers]"></asp:SqlDataSource>
        <asp:Button ID="Button1" runat="server" Text="Registrar usuario" PostBackUrl="~/Account/Register.aspx" Height="36px" Width="181px" CssClass="btn btn-default"/>
    <br/>
    <br/>
    


    </div>


    </asp:Content>
