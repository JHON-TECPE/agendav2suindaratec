-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Tempo de geração: 05-Fev-2026 às 10:31
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
  `cor` varchar(20) DEFAULT '#3788d8',
  `observacoes` text,
  `tecnico_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `agenda_eventos`
--

INSERT INTO `agenda_eventos` (`id`, `ocorrencia_id`, `cliente_id`, `colaborador_id`, `titulo`, `inicio`, `fim`, `cor`, `observacoes`, `tecnico_id`) VALUES
(1, NULL, 9, 2, 'Demo com o cliente Arruda', '2026-02-05 09:00:00', '2026-02-05 10:00:00', '#00e5ff', '', 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `chat_mensagens`
--

CREATE TABLE `chat_mensagens` (
  `id` int NOT NULL,
  `usuario_id` int NOT NULL,
  `mensagem` text NOT NULL,
  `data_envio` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `chat_mensagens`
--

INSERT INTO `chat_mensagens` (`id`, `usuario_id`, `mensagem`, `data_envio`) VALUES
(1, 2, 'fala Doutor', '2026-02-04 13:23:01'),
(2, 2, 'posso vender esse projeto para matriz ?', '2026-02-04 13:23:17'),
(3, 3, 'Manda bala kkkkk', '2026-02-04 22:33:19');

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
(1, 'J', '60752983000144', 'JAILMA SEVERINA DE CARVALHO', 'Pizzaria Sphiraria ', '', '', '', '', '55670-000', 'Terça - Domingo 17 h - 23 H', 'Pizzaria', 'Jailma - Emmanuel', '', '2026-02-04 12:43:54'),
(6, 'J', '60.983.478/0001-00', 'OLINDA DISTRIBUIDORA DE BEBIDAS LTDA', 'OLINDA BEBIDAS', 'Avenida Governador Carlos de Lima Cavalcante', 'Bairro Novo', 'Olinda', 'PE', '53030265', '', 'Distribuidora de Bebidas', 'João', '', '2026-02-04 13:43:08'),
(7, 'J', '38214410000108', 'DAVID AUSTIN CABRAL SILVA', 'SUPERMERCADO BOM JESUS', 'Centro', 'CENTRO', 'São Joaquim do Monte', 'PE', '55670000', NULL, 'mercadinho', 'David', 'fluxo de Mercadinho normal', '2026-02-04 13:47:09'),
(9, 'J', '47221514000130', 'Fabio Arruda', 'Lanchonete do Arruda', NULL, NULL, NULL, NULL, NULL, 'Quarta - Domingo  18h as 22h', 'Lanchonete', 'Fabio Arruda', 'O cliente trabalha em um fudtruck e não tem cozinha então tem que sair duas vias do pedido, uma para cozinha e outra para o cliente, o mesmo tem um painel para tocar o codigo do pedido para o cliente vir buscar, no demais é fluxo simples caixa e venda.  A única modalidade que pode atrapalhar é o painel integrado.', '2026-02-04 19:49:30'),
(10, 'J', '47289977076', 'Nubia ', 'Nubia', NULL, NULL, NULL, NULL, NULL, NULL, 'Varejo', 'Nubia', 'A cliente vende vinhos e tem uma loja de peças automotivas, vamos seguir negociação.', '2026-02-05 10:21:57');

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
(3, 1, 'Simples', NULL, 20.50, 12.00, 0.00, 0.00, 0.00, 0, '', 0.90, 0.00, 0.10),
(4, 7, 'Simples', NULL, 0.00, 0.00, 0.00, 0.00, 0.00, 0, NULL, 0.00, 0.00, 0.00);

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
-- Estrutura da tabela `fin_lancamentos`
--

CREATE TABLE `fin_lancamentos` (
  `id` int NOT NULL,
  `tipo` enum('receita','despesa') NOT NULL,
  `descricao` varchar(200) NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `data_vencimento` date NOT NULL,
  `data_pagamento` date DEFAULT NULL,
  `status` enum('pendente','pago') DEFAULT 'pendente',
  `categoria` varchar(100) DEFAULT 'Geral',
  `observacoes` text,
  `criado_em` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `fin_lancamentos`
--

INSERT INTO `fin_lancamentos` (`id`, `tipo`, `descricao`, `valor`, `data_vencimento`, `data_pagamento`, `status`, `categoria`, `observacoes`, `criado_em`) VALUES
(1, 'despesa', 'Energia Escritório  (1/12)', 100.00, '2026-03-10', NULL, 'pendente', 'Fornecedores', '', '2026-02-04 20:08:52'),
(2, 'despesa', 'Energia Escritório  (2/12)', 100.00, '2026-04-10', NULL, 'pendente', 'Fornecedores', '', '2026-02-04 20:08:52'),
(3, 'despesa', 'Energia Escritório  (3/12)', 100.00, '2026-05-10', NULL, 'pendente', 'Fornecedores', '', '2026-02-04 20:08:52'),
(4, 'despesa', 'Energia Escritório  (4/12)', 100.00, '2026-06-10', NULL, 'pendente', 'Fornecedores', '', '2026-02-04 20:08:52'),
(5, 'despesa', 'Energia Escritório  (5/12)', 100.00, '2026-07-10', NULL, 'pendente', 'Fornecedores', '', '2026-02-04 20:08:52'),
(6, 'despesa', 'Energia Escritório  (6/12)', 100.00, '2026-08-10', NULL, 'pendente', 'Fornecedores', '', '2026-02-04 20:08:52'),
(7, 'despesa', 'Energia Escritório  (7/12)', 100.00, '2026-09-10', NULL, 'pendente', 'Fornecedores', '', '2026-02-04 20:08:52'),
(8, 'despesa', 'Energia Escritório  (8/12)', 100.00, '2026-10-10', NULL, 'pendente', 'Fornecedores', '', '2026-02-04 20:08:52'),
(9, 'despesa', 'Energia Escritório  (9/12)', 100.00, '2026-11-10', NULL, 'pendente', 'Fornecedores', '', '2026-02-04 20:08:52'),
(10, 'despesa', 'Energia Escritório  (10/12)', 100.00, '2026-12-10', NULL, 'pendente', 'Fornecedores', '', '2026-02-04 20:08:52'),
(11, 'despesa', 'Energia Escritório  (11/12)', 100.00, '2027-01-10', NULL, 'pendente', 'Fornecedores', '', '2026-02-04 20:08:52'),
(12, 'despesa', 'Energia Escritório  (12/12)', 100.00, '2027-02-10', NULL, 'pendente', 'Fornecedores', '', '2026-02-04 20:08:52'),
(13, 'receita', 'Jailma Pizzaria São Joaquim  (1/12)', 200.00, '2026-02-28', NULL, 'pendente', 'Contrato Mensal', '', '2026-02-04 20:10:32'),
(14, 'receita', 'Jailma Pizzaria São Joaquim  (2/12)', 200.00, '2026-03-28', NULL, 'pendente', 'Contrato Mensal', '', '2026-02-04 20:10:32'),
(15, 'receita', 'Jailma Pizzaria São Joaquim  (3/12)', 200.00, '2026-04-28', NULL, 'pendente', 'Contrato Mensal', '', '2026-02-04 20:10:32'),
(16, 'receita', 'Jailma Pizzaria São Joaquim  (4/12)', 200.00, '2026-05-28', NULL, 'pendente', 'Contrato Mensal', '', '2026-02-04 20:10:32'),
(17, 'receita', 'Jailma Pizzaria São Joaquim  (5/12)', 200.00, '2026-06-28', NULL, 'pendente', 'Contrato Mensal', '', '2026-02-04 20:10:32'),
(18, 'receita', 'Jailma Pizzaria São Joaquim  (6/12)', 200.00, '2026-07-28', NULL, 'pendente', 'Contrato Mensal', '', '2026-02-04 20:10:32'),
(19, 'receita', 'Jailma Pizzaria São Joaquim  (7/12)', 200.00, '2026-08-28', NULL, 'pendente', 'Contrato Mensal', '', '2026-02-04 20:10:32'),
(20, 'receita', 'Jailma Pizzaria São Joaquim  (8/12)', 200.00, '2026-09-28', NULL, 'pendente', 'Contrato Mensal', '', '2026-02-04 20:10:32'),
(21, 'receita', 'Jailma Pizzaria São Joaquim  (9/12)', 200.00, '2026-10-28', NULL, 'pendente', 'Contrato Mensal', '', '2026-02-04 20:10:32'),
(22, 'receita', 'Jailma Pizzaria São Joaquim  (10/12)', 200.00, '2026-11-28', NULL, 'pendente', 'Contrato Mensal', '', '2026-02-04 20:10:32'),
(23, 'receita', 'Jailma Pizzaria São Joaquim  (11/12)', 200.00, '2026-12-28', NULL, 'pendente', 'Contrato Mensal', '', '2026-02-04 20:10:32'),
(24, 'receita', 'Jailma Pizzaria São Joaquim  (12/12)', 200.00, '2027-01-28', NULL, 'pendente', 'Contrato Mensal', '', '2026-02-04 20:10:32');

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

--
-- Extraindo dados da tabela `kanban_cards`
--

INSERT INTO `kanban_cards` (`id`, `ocorrencia_id`, `etapa`, `posicao`, `atualizado_em`) VALUES
(1, 1, 'Prospeccao', 0, '2026-02-04 13:44:22'),
(2, 3, 'Negociacao', 0, '2026-02-05 10:22:58');

-- --------------------------------------------------------

--
-- Estrutura da tabela `ocorrencias`
--

CREATE TABLE `ocorrencias` (
  `id` int NOT NULL,
  `cliente_id` int NOT NULL,
  `tecnico_id` int DEFAULT NULL,
  `solicitante` varchar(100) DEFAULT NULL,
  `assunto` varchar(255) DEFAULT NULL,
  `status` enum('Aberto','Em Andamento','Concluido','Cancelado') DEFAULT 'Aberto',
  `motivo_desc` text,
  `data_abertura` datetime DEFAULT CURRENT_TIMESTAMP,
  `data_retorno` datetime DEFAULT NULL,
  `hora_chegada` time DEFAULT NULL,
  `hora_saida` time DEFAULT NULL,
  `servico_realizado` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `ocorrencias`
--

INSERT INTO `ocorrencias` (`id`, `cliente_id`, `tecnico_id`, `solicitante`, `assunto`, `status`, `motivo_desc`, `data_abertura`, `data_retorno`, `hora_chegada`, `hora_saida`, `servico_realizado`) VALUES
(1, 6, 2, '', 'Venda', 'Em Andamento', 'Siscomercio, mpm +, mini d2.  Cliente interessado no fluxo de voucher.', '2026-02-04 13:44:22', NULL, NULL, NULL, ''),
(2, 7, 2, 'Emmanuel', 'Suporte Técnico', 'Em Andamento', 'importação banco de dados', '2026-02-04 20:52:48', '2026-02-06 10:00:00', NULL, NULL, NULL),
(3, 10, NULL, NULL, 'Venda', 'Aberto', 'Possível negociação de catalogo virtual com forma de pagamento', '2026-02-05 10:22:54', NULL, NULL, NULL, NULL);

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

--
-- Extraindo dados da tabela `pedidos_itens`
--

INSERT INTO `pedidos_itens` (`id`, `pedido_id`, `produto_id`, `quantidade`, `valor_unitario`, `valor_total`) VALUES
(1, 1, 1, 1.00, 200.00, 200.00),
(2, 1, 2, 1.00, 100.00, 100.00);

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

--
-- Extraindo dados da tabela `pedidos_orcamentos`
--

INSERT INTO `pedidos_orcamentos` (`id`, `tipo`, `cliente_id`, `vendedor_id`, `data_emissao`, `validade_dias`, `forma_pagamento`, `observacoes`, `status`, `valor_total`, `desconto`) VALUES
(1, 'orcamento', 9, 2, '2026-02-04', 2, 'Pix', '', 'Aberto', 300.00, 0.00);

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

--
-- Extraindo dados da tabela `produtos`
--

INSERT INTO `produtos` (`id`, `nome`, `tipo`, `estoque_atual`, `preco_compra`, `preco_venda`, `unidade`, `ativo`) VALUES
(1, 'Aquisição Sistema', 'produto', 0.00, 0.00, 500.00, 'UN', 1),
(2, 'Sistema Mensal', 'produto', 0.00, 0.00, 200.00, 'UN', 1);

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
-- Índices para tabela `chat_mensagens`
--
ALTER TABLE `chat_mensagens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuario_id` (`usuario_id`);

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
-- Índices para tabela `fin_lancamentos`
--
ALTER TABLE `fin_lancamentos`
  ADD PRIMARY KEY (`id`);

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
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `chat_mensagens`
--
ALTER TABLE `chat_mensagens`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

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
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `clientes_pos_venda`
--
ALTER TABLE `clientes_pos_venda`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `fin_lancamentos`
--
ALTER TABLE `fin_lancamentos`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de tabela `kanban_cards`
--
ALTER TABLE `kanban_cards`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `ocorrencias`
--
ALTER TABLE `ocorrencias`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `pedidos_itens`
--
ALTER TABLE `pedidos_itens`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `pedidos_orcamentos`
--
ALTER TABLE `pedidos_orcamentos`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `produtos`
--
ALTER TABLE `produtos`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
-- Limitadores para a tabela `chat_mensagens`
--
ALTER TABLE `chat_mensagens`
  ADD CONSTRAINT `chat_mensagens_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE;

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
