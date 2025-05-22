import 'dart:io';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server/gmail.dart';

main() async {
  // Configura as credenciais SMTP do Gmail
  final smtpServer = gmail('ana.luiza15@aluno.ifce.edu.br', 'hdrn dyto kauz tqyd');

  // Cria uma mensagem de e-mail
  final message = Message()
    ..from = Address('ana.luiza15@aluno.ifce.edu.br', 'Luiza')
    ..recipients.add('joao.andrade09@aluno.ifce.edu.br')
    ..subject = 'Assunto do e-mail'
    ..text = 'Corpo do e-mail';

  try {
    // Envia o e-mail usando o servidor SMTP do Gmail
    final sendReport = await send(message, smtpServer);

    // Exibe o resultado do envio do e-mail
    print('E-mail enviado: ${sendReport.toString()}');
  } on MailerException catch (e) {
    // Exibe informações sobre erros de envio de e-mail
    print('Erro ao enviar e-mail: ${e.toString()}');
  }
}