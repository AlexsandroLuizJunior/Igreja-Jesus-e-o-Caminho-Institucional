// No MySQL, deve-se criar um database com o nome "formulario". 
// Criar uma tabela, dessa maneira:
// create table pessoas (
//    codigo int PRIMARY KEY AUTO_INCREMENT,
//    nome   varchar(60) ,
//    contato  varchar(60) ,
//    mensagem  varchar(100)
// );

// Código JSP
<%@ page language="java" import="java.sql.*" %>

<%
    // Cria as variáveis e armazena as informações digitadas pelo usuário
    String vnome = request.getParameter("txtnome");
    String vcontato = request.getParameter("txtcontato");
    String vmensagem = request.getParameter("txtmensagem");

    // Variáveis para acessar o banco de dados
    String database = "formulario";
    String endereco = "jdbc:mysql://localhost:3306/" + database;
    // Observação: 3306 é a porta padrão do MySQL.
    String usuario = "root";
    String senha = "";

    // Driver JDBC
    String driver = "com.mysql.cj.jdbc.Driver";

    try {
        // Carrega o driver na memória
        Class.forName(driver);

        // Cria a variável para conectar com o banco
        Connection conexao = DriverManager.getConnection(endereco, usuario, senha);

        // Variável para o comando Insert do SQL
        String sql = "INSERT INTO mensagens (nome, contato, mensagem) VALUES (?, ?, ?)";

        // Cria a variável Statement para executar o SQL
        PreparedStatement stm = conexao.prepareStatement(sql);
        stm.setString(1, vnome);
        stm.setString(2, vcontato);
        stm.setString(3, vmensagem);

        // Executa o comando e fecha a conexão
        stm.execute();
        stm.close();

        // Retorno para o usuário
        out.print("<h3>Informações enviadas com sucesso!</h3>");
        out.print("<br><br>");
        out.print("<a href='contato.html'>Voltar para a página inicial</a>");
    }
%>