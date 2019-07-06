<%@ Page Title="Home Page" Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="SICE._Default" %>
<script src="Scripts/jquery-3.3.1.js"></script>
<script>
    if ($(window).width() >= 980) {
        console.log($(window).width());
        window.location.replace("/MapArea");
    }
    else {
        window.location.replace("/ListaArea");
    }
</script>