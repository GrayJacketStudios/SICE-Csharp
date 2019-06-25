<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="List.aspx.cs" Inherits="SICE.Events.List" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container" style="margin-top: 10px;">
        <div class="row">
            <div class="col-md-4">
                <!-- #include file="~/Events/menuEventos.html" -->
            </div>
            <div class="col-md-8">
                <h4>Eventos activos</h4>
                 <table class="table">
                    <tr>
                        <th>
                            ID
                        </th>
                        <th>
                            Areas afectadas
                        </th>
                        <th>
                            Tipo de evento
                        </th>
                        <th>
                            Estado de flujo
                        </th>
                        <th>
                            Acciones
                        </th>
                    </tr>

                </table>
            </div>
        </div>
    </div>
   

</asp:Content>
