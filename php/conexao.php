<?php 
	$conexao = mysqli_connect("localhost", "root", "") or die("Erro na conexao!");
	$db = mysqli_select_db($conexao, "eleicao_db") or die("Erro ao selecionar banco de dados!");
?>