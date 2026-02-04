-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Tempo de geração: 04-Fev-2026 às 13:16
-- Versão do servidor: 8.0.44-35
-- versão do PHP: 8.3.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de dados: `hg86d858_suindara_v2`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `agenda_eventos`
--

CREATE TABLE `agenda_eventos` (
  `id` int NOT NULL,
  `ocorrencia_id` int DEFAULT NULL,
  `cliente_id` int NOT NULL,
  `colaborador_id` int NOT NULL,
  `titulo` varchar(150) DEFAULT NULL,
  `inicio` datetime NOT NULL,
  `fim` datetime NOT NULL,
  `cor` varchar(20) DEFAULT '#3788d8'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `clientes`
--

CREATE TABLE `clientes` (
  `id` int NOT NULL,
  `tipo_pessoa` enum('F','J') DEFAULT 'J',
  `cnpj_cpf` varchar(20) NOT NULL,
  `razao_social` varchar(150) NOT NULL,
  `nome_fantasia` varchar(150) DEFAULT NULL,
  `endereco_completo` text,
  `bairro` varchar(100) DEFAULT NULL,
  `cidade` varchar(100) DEFAULT NULL,
  `uf` char(2) DEFAULT NULL,
  `cep` varchar(10) DEFAULT NULL,
  `horario_funcionamento` varchar(100) DEFAULT NULL,
  `segmento` varchar(100) DEFAULT NULL,
  `po_responsavel` varchar(100) DEFAULT NULL,
  `escopo_desc` text,
  `data_cadastro` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `clientes`
--

INSERT INTO `clientes` (`id`, `tipo_pessoa`, `cnpj_cpf`, `razao_social`, `nome_fantasia`, `endereco_completo`, `bairro`, `cidade`, `uf`, `cep`, `horario_funcionamento`, `segmento`, `po_responsavel`, `escopo_desc`, `data_cadastro`) VALUES
(1, 'J', '60752983000144', 'JAILMA SEVERINA DE CARVALHO', 'Pizzaria Sphiraria ', '', '', '', '', '55670-000', 'Terça - Domingo 17 h - 23 H', 'Pizzaria', 'Jailma - Emmanuel', '', '2026-02-04 12:43:54');

-- --------------------------------------------------------

--
-- Estrutura da tabela `clientes_acessos`
--

CREATE TABLE `clientes_acessos` (
  `id` int NOT NULL,
  `cliente_id` int NOT NULL,
  `software` varchar(50) DEFAULT NULL,
  `ip_acesso` varchar(50) DEFAULT NULL,
  `usuario_remoto` varchar(50) DEFAULT NULL,
  `senha_remoto` varchar(100) DEFAULT NULL,
  `codigo_acesso` varchar(50) DEFAULT NULL,
  `computador_nome` varchar(100) DEFAULT NULL,
  `email_noip` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `clientes_certificados`
--

CREATE TABLE `clientes_certificados` (
  `id` int NOT NULL,
  `cliente_id` int NOT NULL,
  `arquivo_nome` varchar(255) DEFAULT NULL,
  `caminho_arquivo` varchar(255) DEFAULT NULL,
  `senha_winrar` varchar(100) DEFAULT NULL,
  `data_upload` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `clientes_contatos`
--

CREATE TABLE `clientes_contatos` (
  `id` int NOT NULL,
  `cliente_id` int NOT NULL,
  `nome` varchar(100) DEFAULT NULL,
  `cargo` varchar(50) DEFAULT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `principal` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `clientes_fiscais`
--

CREATE TABLE `clientes_fiscais` (
  `id` int NOT NULL,
  `cliente_id` int NOT NULL,
  `regime_tributario` varchar(50) DEFAULT NULL,
  `cfop_padrao` varchar(10) DEFAULT NULL,
  `icms_interno` decimal(5,2) DEFAULT '0.00',
  `icms_externo` decimal(5,2) DEFAULT '0.00',
  `pis_aliq` decimal(5,2) DEFAULT '0.00',
  `cofins_aliq` decimal(5,2) DEFAULT '0.00',
  `simples_aliq` decimal(5,2) DEFAULT '0.00',
  `usa_reforma` tinyint(1) DEFAULT '0',
  `ibs_cbs_class` varchar(20) DEFAULT NULL,
  `aliq_cbs` decimal(5,2) DEFAULT '0.00',
  `aliq_ibs_mun` decimal(5,2) DEFAULT '0.00',
  `aliq_ibs_uf` decimal(5,2) DEFAULT '0.00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `clientes_fiscais`
--

INSERT INTO `clientes_fiscais` (`id`, `cliente_id`, `regime_tributario`, `cfop_padrao`, `icms_interno`, `icms_externo`, `pis_aliq`, `cofins_aliq`, `simples_aliq`, `usa_reforma`, `ibs_cbs_class`, `aliq_cbs`, `aliq_ibs_mun`, `aliq_ibs_uf`) VALUES
(3, 1, 'Simples', NULL, 20.50, 12.00, 0.00, 0.00, 0.00, 0, '', 0.90, 0.00, 0.10);

-- --------------------------------------------------------

--
-- Estrutura da tabela `clientes_pos_venda`
--

CREATE TABLE `clientes_pos_venda` (
  `id` int NOT NULL,
  `cliente_id` int NOT NULL,
  `usuario_id` int NOT NULL,
  `texto` text NOT NULL,
  `data_registro` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `kanban_cards`
--

CREATE TABLE `kanban_cards` (
  `id` int NOT NULL,
  `ocorrencia_id` int NOT NULL,
  `etapa` varchar(50) DEFAULT 'Prospeccao',
  `posicao` int DEFAULT '0',
  `atualizado_em` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `ocorrencias`
--

CREATE TABLE `ocorrencias` (
  `id` int NOT NULL,
  `cliente_id` int NOT NULL,
  `tecnico_id` int DEFAULT NULL,
  `solicitante` varchar(100) DEFAULT NULL,
  `assunto` enum('Venda','Duvida','Erro','Cancelamento') NOT NULL,
  `status` enum('Aberto','Em Andamento','Concluido','Cancelado') DEFAULT 'Aberto',
  `motivo_desc` text,
  `data_abertura` datetime DEFAULT CURRENT_TIMESTAMP,
  `data_retorno` datetime DEFAULT NULL,
  `hora_chegada` time DEFAULT NULL,
  `hora_saida` time DEFAULT NULL,
  `servico_realizado` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pedidos_itens`
--

CREATE TABLE `pedidos_itens` (
  `id` int NOT NULL,
  `pedido_id` int NOT NULL,
  `produto_id` int NOT NULL,
  `quantidade` decimal(10,2) NOT NULL,
  `valor_unitario` decimal(10,2) NOT NULL,
  `valor_total` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pedidos_orcamentos`
--

CREATE TABLE `pedidos_orcamentos` (
  `id` int NOT NULL,
  `tipo` enum('orcamento','pedido') NOT NULL,
  `cliente_id` int NOT NULL,
  `vendedor_id` int NOT NULL,
  `data_emissao` date NOT NULL,
  `validade_dias` int DEFAULT '10',
  `forma_pagamento` varchar(100) DEFAULT NULL,
  `observacoes` text,
  `status` varchar(50) DEFAULT 'Aberto',
  `valor_total` decimal(10,2) DEFAULT '0.00',
  `desconto` decimal(10,2) DEFAULT '0.00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `produtos`
--

CREATE TABLE `produtos` (
  `id` int NOT NULL,
  `nome` varchar(150) NOT NULL,
  `tipo` enum('produto','servico') NOT NULL,
  `estoque_atual` decimal(10,2) DEFAULT '0.00',
  `preco_compra` decimal(10,2) DEFAULT '0.00',
  `preco_venda` decimal(10,2) DEFAULT '0.00',
  `unidade` varchar(10) DEFAULT 'UN',
  `ativo` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int NOT NULL,
  `nome` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `senha` varchar(255) NOT NULL,
  `funcao` varchar(100) DEFAULT NULL,
  `ativo` tinyint(1) DEFAULT '1',
  `data_criacao` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `usuarios`
--

INSERT INTO `usuarios` (`id`, `nome`, `email`, `senha`, `funcao`, `ativo`, `data_criacao`) VALUES
(1, 'Admin', 'admin@suindara.com', '$2y$10$yN6uUV.gWTpQO3dd481l8esALBNgU4m6fZVzk43L2e9rSZczdp5mq', 'Administrador', 1, '2026-02-04 18:12:39'),
(2, 'Johnny Santos', 'johnny.santos@suindara.com', '$2y$10$/hg0lvyBABFmMk2DrfnmnOnS6FAqWb8NjR4KzbGFWYhu/mEgP3cxG', 'Administrador', 1, '2026-02-04 12:39:47'),
(3, 'Lucas Gabriel', 'lucas.gabriel@suindara.com', '$2y$10$TR6kQ/nAY53bHA1Zx/cGa.PwI9hEsfpYCSngsF/wIHdnm8DV731zG', 'Administrador', 1, '2026-02-04 13:14:10');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `agenda_eventos`
--
ALTER TABLE `agenda_eventos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cliente_id` (`cliente_id`),
  ADD KEY `colaborador_id` (`colaborador_id`);

--
-- Índices para tabela `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `clientes_acessos`
--
ALTER TABLE `clientes_acessos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cliente_id` (`cliente_id`);

--
-- Índices para tabela `clientes_certificados`
--
ALTER TABLE `clientes_certificados`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cliente_id` (`cliente_id`);

--
-- Índices para tabela `clientes_contatos`
--
ALTER TABLE `clientes_contatos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cliente_id` (`cliente_id`);

--
-- Índices para tabela `clientes_fiscais`
--
ALTER TABLE `clientes_fiscais`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cliente_id` (`cliente_id`);

--
-- Índices para tabela `clientes_pos_venda`
--
ALTER TABLE `clientes_pos_venda`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cliente_id` (`cliente_id`),
  ADD KEY `usuario_id` (`usuario_id`);

--
-- Índices para tabela `kanban_cards`
--
ALTER TABLE `kanban_cards`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ocorrencia_id` (`ocorrencia_id`);

--
-- Índices para tabela `ocorrencias`
--
ALTER TABLE `ocorrencias`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cliente_id` (`cliente_id`),
  ADD KEY `tecnico_id` (`tecnico_id`);

--
-- Índices para tabela `pedidos_itens`
--
ALTER TABLE `pedidos_itens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pedido_id` (`pedido_id`),
  ADD KEY `produto_id` (`produto_id`);

--
-- Índices para tabela `pedidos_orcamentos`
--
ALTER TABLE `pedidos_orcamentos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cliente_id` (`cliente_id`),
  ADD KEY `vendedor_id` (`vendedor_id`);

--
-- Índices para tabela `produtos`
--
ALTER TABLE `produtos`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `agenda_eventos`
--
ALTER TABLE `agenda_eventos`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `clientes_acessos`
--
ALTER TABLE `clientes_acessos`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `clientes_certificados`
--
ALTER TABLE `clientes_certificados`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `clientes_contatos`
--
ALTER TABLE `clientes_contatos`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `clientes_fiscais`
--
ALTER TABLE `clientes_fiscais`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `clientes_pos_venda`
--
ALTER TABLE `clientes_pos_venda`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `kanban_cards`
--
ALTER TABLE `kanban_cards`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `ocorrencias`
--
ALTER TABLE `ocorrencias`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `pedidos_itens`
--
ALTER TABLE `pedidos_itens`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `pedidos_orcamentos`
--
ALTER TABLE `pedidos_orcamentos`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `produtos`
--
ALTER TABLE `produtos`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `agenda_eventos`
--
ALTER TABLE `agenda_eventos`
  ADD CONSTRAINT `agenda_eventos_ibfk_1` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`),
  ADD CONSTRAINT `agenda_eventos_ibfk_2` FOREIGN KEY (`colaborador_id`) REFERENCES `usuarios` (`id`);

--
-- Limitadores para a tabela `clientes_acessos`
--
ALTER TABLE `clientes_acessos`
  ADD CONSTRAINT `clientes_acessos_ibfk_1` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `clientes_certificados`
--
ALTER TABLE `clientes_certificados`
  ADD CONSTRAINT `clientes_certificados_ibfk_1` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `clientes_contatos`
--
ALTER TABLE `clientes_contatos`
  ADD CONSTRAINT `clientes_contatos_ibfk_1` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `clientes_fiscais`
--
ALTER TABLE `clientes_fiscais`
  ADD CONSTRAINT `clientes_fiscais_ibfk_1` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `clientes_pos_venda`
--
ALTER TABLE `clientes_pos_venda`
  ADD CONSTRAINT `clientes_pos_venda_ibfk_1` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `clientes_pos_venda_ibfk_2` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`);

--
-- Limitadores para a tabela `kanban_cards`
--
ALTER TABLE `kanban_cards`
  ADD CONSTRAINT `kanban_cards_ibfk_1` FOREIGN KEY (`ocorrencia_id`) REFERENCES `ocorrencias` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `ocorrencias`
--
ALTER TABLE `ocorrencias`
  ADD CONSTRAINT `ocorrencias_ibfk_1` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`),
  ADD CONSTRAINT `ocorrencias_ibfk_2` FOREIGN KEY (`tecnico_id`) REFERENCES `usuarios` (`id`);

--
-- Limitadores para a tabela `pedidos_itens`
--
ALTER TABLE `pedidos_itens`
  ADD CONSTRAINT `pedidos_itens_ibfk_1` FOREIGN KEY (`pedido_id`) REFERENCES `pedidos_orcamentos` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `pedidos_itens_ibfk_2` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`id`);

--
-- Limitadores para a tabela `pedidos_orcamentos`
--
ALTER TABLE `pedidos_orcamentos`
  ADD CONSTRAINT `pedidos_orcamentos_ibfk_1` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`),
  ADD CONSTRAINT `pedidos_orcamentos_ibfk_2` FOREIGN KEY (`vendedor_id`) REFERENCES `usuarios` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
