<?php
  $link = mysqli_connect("localhost", "root", "", "eleicao_db");
  
  session_start();

  if((!isset ($_SESSION['login']) == true) and (!isset ($_SESSION['senha']) == true)) {
    unset($_SESSION['login']);
    unset($_SESSION['senha']);
    
    header('location:index.php');
  }

  $login = $_SESSION['login'];

  $query = 'SELECT * FROM eleitor WHERE cpf = "'.$login.'" ';
  $result = mysqli_query($link, $query);
	$dados = mysqli_fetch_assoc($result);
  $total = mysqli_num_rows($result);
?>

<!doctype html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!--<meta http-equiv="refresh" content="5">-->

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <!-- Google Fonts -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Roboto+Slab:wght@400;500&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="css/general.css">    

    <link rel="shortcut icon" href="img/bandeira.png" />

    <title>Eleições 2020</title>
</head>

<body>
    <nav class="navbar fixed-top" id="mainNav">
        <div class="container home-top">            
        <a href="home.php">
          <div class="container-logo">Eleições 2020</div>
        </a>

            <div class="info">
                <div class="info-text">
                    <span>Bem vindo, </span>
                    <span><?php echo $dados['nome']; ?></span>
                </div>

                <div class="info-img"></div>
            </div>

        </div>
    </nav>

    <?php if (isset($_GET['res'])) { ?>

      <div class="container-sm" style="margin-top: 10rem;">

        <?php if ($_GET['res'] == 'success') { ?>
          <div class="alert alert-success alert-dismissible fade show" role="alert">
            <strong>Parabéns!</strong> Voto registrado com sucesso.
            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
            
        <?php } elseif ($_GET['res'] == 'error') { ?>
          <div class="alert alert-danger alert-dismissible fade show" role="alert">
            <strong>Ops!</strong> Algo deu errado, tente novamente.
            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
        <?php } ?>

      </div>

    <?php } ?>
    
    <?php if (isset($_GET['res'])) { ?>
      <div class="container home-content">
    <?php } else { ?>
      <div class="container home-content" style="margin-top: 10rem;">
    <?php } ?>
  
      <div class="card" style="width: 18rem; background-color: #F1EAEA;">            
          <div class="card-body">
            <h5 class="card-title">Meu Perfil</h5>
            <p class="card-text">Área para visualização de informações pessoais, realizar consultas e atualização de dados</p>
            <a href="perfil.php" class="btn btn-primary">Ver Perfil</a>
          </div>
        </div>

        <div class="card" style="width: 18rem; background-color: #F1EAEA;">            
          <div class="card-body">
            <h5 class="card-title">Registrar meu voto</h5>
            <p class="card-text">Exerça o seu direito, vote consciente, escolha os nossos representantes e acompanhe</p>
            <a href="voto.php" class="btn btn-primary">Votar</a>
          </div>
        </div>

        <div class="card" style="width: 18rem; background-color: #F1EAEA;">            
          <div class="card-body">
            <h5 class="card-title">Acompanhar Resultado</h5>
            <p class="card-text">Acompanhe a apuração da eleição em tempo real e tenha acesso a mais informações</p>
            <a href="resultado.php" class="btn btn-primary">Visualizar</a>
          </div>
        </div>
    </div>
</body>

</html>