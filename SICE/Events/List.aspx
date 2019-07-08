﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="List.aspx.cs" Inherits="SICE.Events.List" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container" style="margin-top: 10px;">
        <div class="row">
            <div class="col-md-4">
                <!-- #include file="~/Events/menuEventos.html" -->
            </div>
            <div class="col-md-8">
                <h4>Eventos activos</h4>
                  <asp:table class="table" id="tablaEvCal" runat="server" >
                    <asp:TableRow>
                        <asp:TableHeaderCell>
                            ID
                        </asp:TableHeaderCell>
                        <asp:TableHeaderCell>
                            Areas afectadas
                        </asp:TableHeaderCell>
                        <asp:TableHeaderCell>
                            Tipo de evento
                        </asp:TableHeaderCell>
                        <asp:TableHeaderCell>
                            Estado de flujo
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
