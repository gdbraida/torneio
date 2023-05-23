-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3307
-- Tempo de geração: 18-Maio-2023 às 19:02
-- Versão do servidor: 10.4.27-MariaDB
-- versão do PHP: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `game`
--

CREATE DATABASE game;
USE game;

-- --------------------------------------------------------

--
-- Estrutura da tabela `loja`
--

CREATE TABLE `loja` (
  `cod_loja` int(11) NOT NULL,
  `nome` varchar(30) DEFAULT NULL,
  `cod_mapa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `loja`
--

INSERT INTO `loja` (`cod_loja`, `nome`, `cod_mapa`) VALUES
(4, 'Te amo...sqn hahahaha', 2),
(5, 'Nova loja', 2),
(6, 'Nova loja', 3),
(7, 'Nova loja', 4);

-- --------------------------------------------------------

--
-- Estrutura da tabela `mapas`
--

CREATE TABLE `mapas` (
  `cod_mapa` int(11) NOT NULL,
  `nome` varchar(30) NOT NULL,
  `missao` text NOT NULL,
  `clima` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `mapas`
--

INSERT INTO `mapas` (`cod_mapa`, `nome`, `missao`, `clima`) VALUES
(2, 'Vice City', 'Deserto', 'Chuvoso'),
(3, 'Las Vegas', 'Trapassear no Cassino', 'Nublado'),
(4, 'Los Santos', 'Sequestrar avião', 'Ventoso'),
(12, 'Estadio', 'Cidade grande', 'Ensolarado'),
(13, 'Parque naum muito selvagem', 'Selva', 'Ensolarado');

-- --------------------------------------------------------

--
-- Estrutura da tabela `npc`
--

CREATE TABLE `npc` (
  `cod_npc` int(11) NOT NULL,
  `nome` varchar(30) NOT NULL,
  `elemento` varchar(20) NOT NULL,
  `dano` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `npc`
--

INSERT INTO `npc` (`cod_npc`, `nome`, `elemento`, `dano`) VALUES
(1, 'George', 'terra', 2),
(2, 'Peppa', 'terra', 9999),
(3, 'Naruto', 'ar', 10),
(4, 'Goku', 'fogo', 8000),
(5, 'Pocoiô', 'água', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `npc_mapas`
--

CREATE TABLE `npc_mapas` (
  `cod_npc_mapas` int(11) NOT NULL,
  `cod_npc` int(11) NOT NULL,
  `cod_mapa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `npc_mapas`
--

INSERT INTO `npc_mapas` (`cod_npc_mapas`, `cod_npc`, `cod_mapa`) VALUES
(15, 1, 2),
(16, 1, 3),
(17, 1, 4),
(18, 2, 2),
(19, 2, 3),
(21, 3, 2),
(23, 4, 2),
(24, 4, 3),
(25, 4, 4),
(26, 5, 4);

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL,
  `nome` varchar(50) DEFAULT NULL,
  `senha` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `nome`, `senha`) VALUES
(1, 'Alberto Roberto', '1234'),
(2, 'Filomena Josefa', '4321');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `loja`
--
ALTER TABLE `loja`
  ADD PRIMARY KEY (`cod_loja`),
  ADD KEY `cod_mapa` (`cod_mapa`);

--
-- Índices para tabela `mapas`
--
ALTER TABLE `mapas`
  ADD PRIMARY KEY (`cod_mapa`);

--
-- Índices para tabela `npc`
--
ALTER TABLE `npc`
  ADD PRIMARY KEY (`cod_npc`);

--
-- Índices para tabela `npc_mapas`
--
ALTER TABLE `npc_mapas`
  ADD PRIMARY KEY (`cod_npc_mapas`),
  ADD KEY `cod_npc` (`cod_npc`),
  ADD KEY `cod_mapa` (`cod_mapa`);

--
-- Índices para tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `loja`
--
ALTER TABLE `loja`
  MODIFY `cod_loja` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `mapas`
--
ALTER TABLE `mapas`
  MODIFY `cod_mapa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de tabela `npc`
--
ALTER TABLE `npc`
  MODIFY `cod_npc` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `npc_mapas`
--
ALTER TABLE `npc_mapas`
  MODIFY `cod_npc_mapas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT de tabela `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `loja`
--
ALTER TABLE `loja`
  ADD CONSTRAINT `loja_ibfk_1` FOREIGN KEY (`cod_mapa`) REFERENCES `mapas` (`cod_mapa`);

--
-- Limitadores para a tabela `npc_mapas`
--
ALTER TABLE `npc_mapas`
  ADD CONSTRAINT `npc_mapas_ibfk_1` FOREIGN KEY (`cod_npc`) REFERENCES `npc` (`cod_npc`),
  ADD CONSTRAINT `npc_mapas_ibfk_2` FOREIGN KEY (`cod_mapa`) REFERENCES `mapas` (`cod_mapa`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
