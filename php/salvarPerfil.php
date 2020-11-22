<?php
    // PHP 7
    $link = mysqli_connect("localhost", "root", "", "eleicao_db");

    $nome = $_POST['nome'];
    $email = $_POST['email'];

    $query = 'UPDATE eleitor SET nome = "'.$nome.'", email = "'.$email.'" WHERE id = "1" ';
    $result = mysqli_query($link, $query);

    if ($result) {
        header('Location: ../perfil.php?res=success');
    } else {
        header('Location: ../perfil.php?res=error');
    }
?>