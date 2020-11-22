-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 22-Nov-2020 às 05:07
-- Versão do servidor: 10.4.16-MariaDB
-- versão do PHP: 7.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `eleicao_db`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `candidato`
--

CREATE TABLE `candidato` (
  `id` int(10) NOT NULL,
  `nome` varchar(50) COLLATE utf8_bin NOT NULL,
  `partido` varchar(20) COLLATE utf8_bin NOT NULL,
  `numero` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Extraindo dados da tabela `candidato`
--

INSERT INTO `candidato` (`id`, `nome`, `partido`, `numero`) VALUES
(1, 'Haylo Neto', 'ESTACIOAM', 40),
(2, 'Ivanildo do 437', 'PARACOMISSO', 11),
(3, 'João Marques', 'PARINTINS', 32),
(4, 'José Francisco', 'PODEMOS', 9),
(5, 'Hércules Pontes', 'PODEMOS', 15);

-- --------------------------------------------------------

--
-- Estrutura da tabela `eleitor`
--

CREATE TABLE `eleitor` (
  `id` int(5) NOT NULL,
  `nome` varchar(80) COLLATE utf8_bin NOT NULL,
  `cpf` int(15) NOT NULL,
  `sexo` varchar(20) COLLATE utf8_bin NOT NULL,
  `email` varchar(80) COLLATE utf8_bin NOT NULL,
  `senha` varchar(8) COLLATE utf8_bin NOT NULL,
  `numero` varchar(20) COLLATE utf8_bin NOT NULL,
  `secao` int(5) NOT NULL,
  `zona` int(5) NOT NULL,
  `local` varchar(50) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Extraindo dados da tabela `eleitor`
--

INSERT INTO `eleitor` (`id`, `nome`, `cpf`, `sexo`, `email`, `senha`, `numero`, `secao`, `zona`, `local`) VALUES
(1, 'Rodrigo Azevedo da Costa', 297002233, 'masculino', 'rodrigo@gmail.com', '123456', '2360 1733 2190 0141', 667, 31, 'E. E. Bem Ali Logo Lá'),
(2, 'Julio Neves da Silva', 297002211, 'masculino', 'julio@gmail.com', '123456', '0', 0, 0, ''),
(3, 'Maria Juliana de Amorim', 297002219, 'feminino', 'maria@gmail.com', '123456', '0', 0, 0, ''),
(4, 'Carolina Bastos Bentes Brasil', 297002218, 'feminino', 'carolina@gmail.com', '123456', '0', 0, 0, ''),
(5, 'Marcos Braga de Aquino', 297002214, 'masculino', 'marcos@gmail.com', '123456', '0', 0, 0, ''),
(6, 'Ana Paula Patrícia Carol Marques', 297002212, 'feminino', 'clebson@gmail.com', '123456', '0', 0, 0, ''),
(7, 'Patrícia Pilar', 297002220, 'feminino', 'patricia@gmail.com', '123456', '0', 0, 0, ''),
(8, 'Letícia Alcântara', 297002205, 'feminino', 'leticia@gmail.com', '123456', '0', 0, 0, ''),
(9, 'Carlos Eduardo', 297002206, 'feminino', 'carlos@gmail.com', '123456', '0', 0, 0, ''),
(10, 'Samara Neves', 297002209, 'feminino', 'samara@gmail.com', '123456', '0', 0, 0, '');

-- --------------------------------------------------------

--
-- Estrutura da tabela `voto`
--

CREATE TABLE `voto` (
  `id` int(5) NOT NULL,
  `id_candidato` int(5) NOT NULL,
  `id_eleitor` int(5) NOT NULL,
  `data_hora` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Extraindo dados da tabela `voto`
--

INSERT INTO `voto` (`id`, `id_candidato`, `id_eleitor`, `data_hora`) VALUES
(1, 5, 1, '2020-11-22 03:39:07');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `candidato`
--
ALTER TABLE `candidato`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `eleitor`
--
ALTER TABLE `eleitor`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `voto`
--
ALTER TABLE `voto`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_ELEITOR` (`id_eleitor`),
  ADD KEY `FK_CANDIDATO` (`id_candidato`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `candidato`
--
ALTER TABLE `candidato`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `eleitor`
--
ALTER TABLE `eleitor`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `voto`
--
ALTER TABLE `voto`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `voto`
--
ALTER TABLE `voto`
  ADD CONSTRAINT `FK_CANDIDATO` FOREIGN KEY (`id_candidato`) REFERENCES `candidato` (`id`),
  ADD CONSTRAINT `FK_ELEITOR` FOREIGN KEY (`id_eleitor`) REFERENCES `eleitor` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
