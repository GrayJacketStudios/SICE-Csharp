<%@ Page Title="Eventos" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="SICE._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
<div>

              <%-- En este espacio se verifica que el usuario haya iniciado sesión. Un usuario anonimo verá este mensaje y se le dará un link para volver al inicio --%> 
       <asp:LoginView runat="server" ViewStateMode="Disabled">            
            <AnonymousTemplate>
    <h1>Acceso no autorizado.</h1>
    <a href="Default.aspx">Volver al inicio</a>
            </AnonymousTemplate>
    <%-- ------------------------- FIN ESPACIO --------------------------------- --%> 
            <LoggedInTemplate>
                <h1>TO DO</h1>
            </LoggedInTemplate>
       </asp:LoginView>

</div>
</asp:Content>