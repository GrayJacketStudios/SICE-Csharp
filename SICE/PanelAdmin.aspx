<%@ Page Title="Panel de administrador" MasterPageFile="~/Site.Master" Language="C#" AutoEventWireup="true" CodeBehind="PanelAdmin.aspx.cs" Inherits="SICE.PanelAdmin" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="col-md-12" >
      <h1>Panel de administración</h1>
              <br />
       <ul class="list-group">
           <li class="list-group-item">
               <a runat="server" href="~/admin/usuarios/UserList.aspx">Lista de usuarios</a>
           </li>
       </ul>
    </div>


    </asp:Content>
