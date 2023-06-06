CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `gender` varchar(100) NOT NULL,
  `country` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `usuario` (`id`, `nome`, `password`, `email`, `sexo`, `pais`) VALUES
(05, 'José', 'Valente', 'jose@gmail.com', 'Masculino', 'Brasil'),
(06, 'Ana', 'Vitoria', 'ana@gmail.com', 'Feminino', 'Brasil'),
(08, 'Maria', 'Francisca', 'maria@gmail.com', 'Feminino', 'Brasil');