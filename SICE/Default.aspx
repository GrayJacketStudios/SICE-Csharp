<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="SICE._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div align="center">
        <div class="jumbotron">
            <h1>SICE</h1><br/>
            <p class="lead">Sistema informático de control eléctrico.</p>
               <asp:LoginView runat="server" ViewStateMode="Disabled">
                  <%-- En este espacio aparecerá un boton que, de haber ingresado al sistema, enviara al usuario al mapa de areas, de lo contrario, lo llevará al formulario de ingreso --%> 
                    <AnonymousTemplate>
                       <p><a runat="server" href="~/Account/Login" class="btn btn-primary btn-lg">Ingresar al sistema &raquo;</a></p>
                     </AnonymousTemplate>
                     <LoggedInTemplate>
                       <p><a runat="server" href="~/About" class="btn btn-primary btn-lg">Ingresar al sistema &raquo;</a></p>
                     </LoggedInTemplate>
                   <%-- FIN ESPACIO --%> 
                </asp:LoginView>
        </div>
    </div>
    </asp:Content>
