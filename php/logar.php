<?php
    // PHP 7
    $link = mysqli_connect("localhost", "root", "", "eleicao_db");

    session_start();

    $login = $_POST['cpf'];
    $senha = $_POST['senha'];

    $query = 'SELECT * FROM eleitor WHERE cpf = "'.$login.'" and senha = "'.$senha.'" ';
    $result = mysqli_query($link, $query);
	$dados = mysqli_fetch_assoc($result);
    $total = mysqli_num_rows($result);

    if($total > 0 ) {
        $_SESSION['login'] = $login;
        $_SESSION['senha'] = $senha;

        header('location:../home.php');
    } else {
        unset ($_SESSION['login']);
        unset ($_SESSION['senha']);

        header('location:../index.php');
  }
?>