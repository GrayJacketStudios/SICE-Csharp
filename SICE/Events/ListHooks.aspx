<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ListHooks.aspx.cs" Inherits="SICE.Events.ListHooks" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container" style="margin-top: 10px;">
        <div class="row">
            <div class="col-md-4">
                <!-- #include file="~/Events/menuEventos.html" -->
            </div>
            <div class="col-md-8">
                <h4>Eventos por hooks</h4>
                <a href="#" class="btn btn-success">Nuevo evento</a>
                 <asp:table class="table" id="tablaEvCal" runat="server" >
                    <asp:TableRow>
                        <asp:TableHeaderCell>
                            ID
                        </asp:TableHeaderCell>
                        <asp:TableHeaderCell>
                            Areas afectadas
                        </asp:TableHeaderCell>
                        <asp:TableHeaderCell>
                            Lectura para inicio
                        </asp:TableHeaderCell>
                        <asp:TableHeaderCell>
                            Lectura para termino
                        </asp:TableHeaderCell>
                        <asp:TableHeaderCell>
                            Estado de flujo deseado
                        </asp:TableHeaderCell>
                        <asp:TableHeaderCell>
                            Acciones
                        </asp:TableHeaderCell>
                    </asp:TableRow>

                </asp:table>
                
            </div>
        </div>
    </div>
</asp:Content>
