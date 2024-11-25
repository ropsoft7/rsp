#!/usr/local/bin/rsp.nodeJS

const RSp = require("rsp-libjscript");
const rsp = new RSp();
const path = require("path");

// Obtém o nome do usuário da variável de ambiente
const username = process.env.USER;

if (!username) {
    rsp.prin("Erro: Nome do usuário não foi fornecido.", { type: "error" });
    process.exit(1);
}

(async () => {
    try {
        // Prompt para verificar se o usuário será administrador
        const isAdmin = await rsp.prompt(async ({ askBoolean }) =>
            await askBoolean("Is the user an admin? (Default: y)")
        );

        if (isAdmin) {
            try {
                // Adiciona o usuário aos grupos 'adm' e 'sudo'
                rsp.exec(`usermod -a -G adm ${username}`);
                rsp.exec(`usermod -a -G sudo ${username}`);
                rsp.prin(
                    `Usuário "${username}" adicionado aos grupos 'adm' e 'sudo'.`,
                    { type: "success" }
                );
            } catch (error) {
                rsp.prin(
                    `Erro ao adicionar o usuário "${username}" aos grupos: ${error.message}`,
                    { type: "error" }
                );
            }
        } else {
            rsp.prin(
                `Usuário "${username}" configurado como comum.`,
                { type: "info" }
            );
        }

        // Entra no diretório home do usuário
        const userHome = path.join("/home", username);

        if (!userHome) {
            rsp.prin(`Erro ao localizar o diretório do usuário: ${username}.`, {
                type: "error",
            });
            process.exit(1);
        }

        // Executa o rebranding
        try {
            rsp.exec(`/usr/local/bin/rsp.projectRebrandir e ${username}`);
            rsp.prin(
                `Rebranding concluído para o usuário "${username}".`,
                { type: "success" }
            );
        } catch (error) {
            rsp.prin(
                `Erro ao executar o rebranding para "${username}": ${error.message}`,
                { type: "error" }
            );
        }

        // Pergunta se o usuário deseja sair da sessão atual
        const leaveSession = await rsp.prompt(({ askBoolean }) =>
            askBoolean("Do you want to leave the current session? (Default: n)")
        );

        if (leaveSession) {
            rsp.prin("Saindo da sessão atual...", { type: "info" });
            try {
                rsp.exec("logout");
            } catch (error) {
                rsp.prin(
                    `Erro ao sair da sessão: ${error.message}`,
                    { type: "error" }
                );
            }
        } else {
            rsp.prin("Permanecendo na sessão atual.", { type: "info" });
        }
    } catch (error) {
        rsp.prin(`Erro inesperado: ${error.message}`, { type: "error" });
        process.exit(1);
    }
})();
