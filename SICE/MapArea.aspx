﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MapArea.aspx.cs" Inherits="SICE.MapArea" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
        <div class="row">
        <div class="col-md-12">
            <h2 style="text-align:center;">Mapa de areas</h2>
            <div class="mapa" id="MapaDiv" runat="server">
            </div>
        </div>
    </div>

    <!-- Modal content 
        * Aqui mostraremos todos los datos de interes de cada Area
        -->
    <div class="modal-content" id="modalForMap">
        <div class="modal-header">
            <span id="close" class="close" onclick="hideModal();">&times;</span>
            <h2>Area </h2>
        </div>
        <div class="modal-body">
        </div>
    </div> 
</asp:Content>
