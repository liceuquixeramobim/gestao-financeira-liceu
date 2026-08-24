<!DOCTYPE html>
<html lang="pt-BR">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
  <title>Gestão Financeira - EEMTI Liceu Alfredo Almeida Machado</title>
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
  <style>
    :root {
      --cor-azul-liceu: #023e8a;
      --cor-fundo: #f0f4f8;
      --cor-card: #ffffff;
      --cor-texto: #1e293b;
      --cor-suave: #64748b;
      
      --cor-seguro: #10b981;     /* Verde */
      --cor-atencao: #f59e0b;    /* Amarelo */
      --cor-perigo: #f97316;     /* Laranja */
      --cor-alto: #ef4444;       /* Vermelho */
    }

    * { box-sizing: border-box; margin: 0; padding: 0; font-family: 'Segoe UI', Roboto, sans-serif; }

    body { 
      background-color: var(--cor-fundo); 
      background-image: radial-gradient(#cbd5e1 1px, transparent 1px);
      background-size: 20px 20px;
      color: var(--cor-texto); 
      display: flex; 
      justify-content: center; 
      min-height: 100vh; 
      padding-bottom: 85px; 
    }

    .app-container {
      width: 100%;
      max-width: 450px;
      position: relative;
    }

    /* TOPO COM A FACHADA DA ESCOLA */
    .cabecalho-escola {
      position: relative;
      height: 250px;
      background: linear-gradient(180deg, rgba(2, 62, 138, 0.4) 0%, rgba(2, 62, 138, 0.92) 100%), 
                  url('IMG_0803.jpg') center 25% / cover no-repeat;
      display: flex;
      align-items: flex-end;
      padding: 20px 20px 50px 20px;
      border-bottom-left-radius: 30px;
      border-bottom-right-radius: 30px;
      overflow: hidden;
      box-shadow: 0 10px 20px rgba(2, 62, 138, 0.2);
    }

    .info-escola-container {
      display: flex;
      align-items: center;
      gap: 14px;
      z-index: 2;
    }

    .logo-escola {
      width: 65px;
      height: 65px;
      object-fit: cover;
      border-radius: 16px;
      border: 3px solid #ffffff;
      box-shadow: 0 6px 12px rgba(0,0,0,0.3);
      background: #fff;
    }

    .texto-escola h1 {
      font-size: 1.1rem;
      color: #ffffff;
      font-weight: 800;
      line-height: 1.2;
      text-shadow: 0 2px 4px rgba(0,0,0,0.6);
    }

    .texto-escola p {
      font-size: 0.78rem;
      color: #e2e8f0;
      margin-top: 4px;
      font-weight: 600;
    }

    /* CARD DO SEMÁFORO DE RISCO */
    .card-semaforo {
      background: var(--cor-card);
      border-radius: 24px;
      margin: -35px 18px 15px 18px;
      padding: 20px;
      box-shadow: 0 12px 30px rgba(0,0,0,0.12);
      position: relative;
      z-index: 10;
      border: 1px solid rgba(255,255,255,0.8);
    }

    .alerta-semaforo {
      display: flex;
      align-items: center;
      justify-content: center;
      gap: 10px;
      text-align: center;
      padding: 14px;
      border-radius: 16px;
      color: #ffffff;
      font-weight: 800;
      font-size: 0.88rem;
      transition: all 0.4s ease;
      box-shadow: 0 6px 15px rgba(0,0,0,0.15);
      text-transform: uppercase;
    }

    .resumo-valores {
      display: grid;
      grid-template-columns: 1fr 1fr 1fr;
      gap: 8px;
      text-align: center;
      border-top: 2px dashed #e2e8f0;
      padding-top: 14px;
      margin-top: 14px;
    }

    .coluna-valor {
      background: #f8fafc;
      padding: 8px 4px;
      border-radius: 12px;
    }

    .coluna-valor span {
      font-size: 0.65rem;
      color: var(--cor-suave);
      font-weight: 700;
      text-transform: uppercase;
      display: block;
    }

    .coluna-valor strong {
      display: block;
      font-size: 0.95rem;
      margin-top: 2px;
    }

    /* ABAS DE CONTEÚDO */
    .aba-conteudo { display: none; padding: 0 18px; }
    .aba-conteudo.ativa { display: block; }

    .card-formulario {
      background: var(--cor-card);
      border-radius: 22px;
      padding: 20px;
      box-shadow: 0 6px 18px rgba(0,0,0,0.04);
      margin-bottom: 20px;
    }

    .titulo-card {
      font-size: 1rem;
      color: var(--cor-azul-liceu);
      font-weight: 800;
      margin-bottom: 16px;
      display: flex;
      align-items: center;
      gap: 8px;
    }

    .seletor-tipo {
      display: grid;
      grid-template-columns: 1fr 1fr;
      gap: 12px;
      margin-bottom: 16px;
    }

    .btn-tipo {
      padding: 12px;
      text-align: center;
      background: #f1f5f9;
      border-radius: 14px;
      color: var(--cor-suave);
      font-weight: 700;
      font-size: 0.85rem;
      cursor: pointer;
      display: flex;
      align-items: center;
      justify-content: center;
      gap: 6px;
    }

    .btn-tipo.ativo.ganho { background: var(--cor-seguro); color: #fff; }
    .btn-tipo.ativo.gasto { background: var(--cor-alto); color: #fff; }

    .campo { margin-bottom: 14px; }
    .campo label { display: block; font-size: 0.78rem; color: var(--cor-suave); font-weight: 700; margin-bottom: 6px; }
    .campo input, .campo select { 
      width: 100%; 
      border: 2px solid #e2e8f0; 
      padding: 12px; 
      border-radius: 12px; 
      font-size: 0.95rem; 
      outline: none;
      background: #fff;
    }

    .btn-salvar {
      width: 100%;
      background: linear-gradient(135deg, #023e8a 0%, #0077b6 100%);
      color: #fff;
      border: none;
      padding: 14px;
      border-radius: 14px;
      font-size: 0.95rem;
      font-weight: 800;
      cursor: pointer;
    }

    /* ESTILOS DA REGRA 50/30/20 */
    .grid-regra-503020 {
      display: grid;
      grid-template-columns: 1fr 1fr 1fr;
      gap: 8px;
      margin-top: 10px;
      text-align: center;
    }

    .card-regra-item {
      padding: 10px 6px;
      border-radius: 12px;
      background: #f8fafc;
      border: 1px solid #e2e8f0;
    }

    .card-regra-item h6 { font-size: 0.72rem; color: var(--cor-suave); font-weight: 800; }
    .card-regra-item p { font-size: 0.65rem; color: #94a3b8; margin: 2px 0 4px 0; }
    .card-regra-item strong { font-size: 0.88rem; color: var(--cor-azul-liceu); }

    .btn-resetar-tudo {
      width: 100%;
      background: #fee2e2;
      color: #dc2626;
      border: 1px solid #fca5a5;
      padding: 12px;
      border-radius: 12px;
      font-size: 0.88rem;
      font-weight: 700;
      cursor: pointer;
      margin-top: 15px;
      display: flex;
      align-items: center;
      justify-content: center;
      gap: 8px;
    }

    /* LEGENDA DO SEMÁFORO */
    .item-legenda {
      display: flex;
      align-items: flex-start;
      gap: 12px;
      padding: 10px 0;
      border-bottom: 1px dashed #e2e8f0;
    }

    .bolinha-cor {
      width: 16px;
      height: 16px;
      border-radius: 50%;
      margin-top: 3px;
      flex-shrink: 0;
    }

    .texto-legenda h5 { font-size: 0.85rem; font-weight: 700; color: var(--cor-texto); }
    .texto-legenda p { font-size: 0.75rem; color: var(--cor-suave); line-height: 1.3; }

    /* EXTRATO */
    .item-extrato {
      display: flex;
      justify-content: space-between;
      align-items: center;
      padding: 12px 0;
      border-bottom: 1px solid #f1f5f9;
    }

    .item-extrato .info h4 { font-size: 0.88rem; color: var(--cor-texto); font-weight: 700; }
    .item-extrato .info span { font-size: 0.72rem; color: var(--cor-suave); }

    .lado-direito-item {
      display: flex;
      align-items: center;
      gap: 12px;
    }

    .btn-deletar-item {
      color: #94a3b8;
      cursor: pointer;
      font-size: 0.95rem;
      transition: color 0.2s;
      padding: 4px;
    }

    .btn-deletar-item:hover { color: var(--cor-alto); }

    /* NAVEGAÇÃO INFERIOR */
    .menu-inferior {
      position: fixed;
      bottom: 0;
      width: 100%;
      max-width: 450px;
      height: 70px;
      background: #ffffff;
      border-top: 1px solid #e2e8f0;
      display: grid;
      grid-template-columns: 1fr 1fr 1fr 1fr;
      align-items: center;
      z-index: 100;
      box-shadow: 0 -4px 20px rgba(0,0,0,0.06);
      border-top-left-radius: 20px;
      border-top-right-radius: 20px;
    }

    .item-menu {
      display: flex;
      flex-direction: column;
      align-items: center;
      color: var(--cor-suave);
      font-size: 0.68rem;
      font-weight: 700;
      cursor: pointer;
    }

    .item-menu i { font-size: 1.2rem; margin-bottom: 3px; }
    .item-menu.ativo { color: var(--cor-azul-liceu); }
  </style>
</head>
<body>

  <div class="app-container">

    <!-- TOPO -->
    <div class="cabecalho-escola">
      <div class="info-escola-container">
        <img src="logo.jpg" alt="Logo Liceu" class="logo-escola">
        <div class="texto-escola">
          <h1>EEMTI Liceu Alfredo Almeida Machado</h1>
          <p>🎓 Educação & Controle Financeiro</p>
        </div>
      </div>
    </div>

    <!-- SEMÁFORO DE RISCO -->
    <div class="card-semaforo">
      <div id="box-status" class="alerta-semaforo" style="background: var(--cor-seguro);">
        <i id="icone-semaforo" class="fa-solid fa-shield-halved"></i>
        <span id="texto-semaforo">Carregando análise...</span>
      </div>

      <div class="resumo-valores">
        <div class="coluna-valor">
          <span>Ganhos</span>
          <strong id="val-ganhos" style="color: var(--cor-seguro);">R$ 0,00</strong>
        </div>
        <div class="coluna-valor">
          <span>Gastos</span>
          <strong id="val-gastos" style="color: var(--cor-alto);">R$ 0,00</strong>
        </div>
        <div class="coluna-valor">
          <span>Saldo</span>
          <strong id="val-saldo">R$ 0,00</strong>
        </div>
      </div>
    </div>

    <!-- ABA 1: NOVO LANÇAMENTO -->
    <div id="aba-adicionar" class="aba-conteudo ativa">
      <div class="card-formulario">
        <h3 class="titulo-card"><i class="fa-solid fa-wallet"></i> Novo Lançamento</h3>
        <form id="form-movimentacao">
          
          <div class="seletor-tipo">
            <div class="btn-tipo ativo ganho" id="btn-tipo-ganho" onclick="trocarTipo('ganho')">
              <i class="fa-solid fa-arrow-up"></i> Entrou (+)
            </div>
            <div class="btn-tipo gasto" id="btn-tipo-gasto" onclick="trocarTipo('gasto')">
              <i class="fa-solid fa-arrow-down"></i> Saiu (-)
            </div>
          </div>

          <div class="campo">
            <label>Descrição</label>
            <input type="text" id="input-desc" placeholder="Ex: Lanche, Mesada, Roupa, Uber" required>
          </div>

          <div class="campo" id="campo-categoria">
            <label>Categoria do Gasto</label>
            <select id="select-categoria">
              <option value="Alimentação">🍕 Alimentação</option>
              <option value="Vestuário">👕 Vestuário / Roupas</option>
              <option value="Transporte">🚌 Transporte / Passagem</option>
              <option value="Lazer">🎮 Lazer / Jogos / Passeios</option>
              <option value="Outros">📦 Outros</option>
            </select>
          </div>

          <div class="campo">
            <label>Valor (R$)</label>
            <input type="number" step="0.01" id="input-valor" placeholder="0,00" required>
          </div>

          <button type="submit" class="btn-salvar">Registrar Movimentação</button>
        </form>
      </div>
    </div>

    <!-- ABA 2: GRÁFICO DE CATEGORIAS -->
    <div id="aba-grafico" class="aba-conteudo">
      <div class="card-formulario">
        <h3 class="titulo-card"><i class="fa-solid fa-chart-pie"></i> Gastos por Categoria</h3>
        <div style="position: relative; height: 230px; width: 100%;">
          <canvas id="graficoCategorias"></canvas>
        </div>
      </div>
    </div>

    <!-- ABA 3: EXTRATO -->
    <div id="aba-extrato" class="aba-conteudo">
      <div class="card-formulario">
        <h3 class="titulo-card"><i class="fa-solid fa-receipt"></i> Histórico de Movimentações</h3>
        <div id="lista-extrato">
          <p style="text-align: center; color: var(--cor-suave); font-size: 0.85rem;">Nenhum registro até o momento.</p>
        </div>
      </div>
    </div>

    <!-- ABA 4: OPÇÕES E PLANEJAMENTO 50/30/20 -->
    <div id="aba-opcoes" class="aba-conteudo">
      <!-- NOVO CARD: REGRA 50/30/20 -->
      <div class="card-formulario">
        <h3 class="titulo-card"><i class="fa-solid fa-calculator"></i> Divisão Ideal (Regra 50/30/20)</h3>
        <p style="font-size: 0.75rem; color: var(--cor-suave); margin-bottom: 10px;">
          Com base na sua renda atual, veja como dividir seu dinheiro de forma saudável:
        </p>
        <div class="grid-regra-503020">
          <div class="card-regra-item">
            <h6>50% Necessidades</h6>
            <p>Essencial</p>
            <strong id="meta-50">R$ 0,00</strong>
          </div>
          <div class="card-regra-item">
            <h6>30% Desejos</h6>
            <p>Lazer/Estilo</p>
            <strong id="meta-30">R$ 0,00</strong>
          </div>
          <div class="card-regra-item">
            <h6>20% Poupança</h6>
            <p>Investimento</p>
            <strong id="meta-20">R$ 0,00</strong>
          </div>
        </div>
      </div>

      <div class="card-formulario">
        <h3 class="titulo-card"><i class="fa-solid fa-book-open"></i> Regras do Semáforo Serasa</h3>
        
        <div class="item-legenda">
          <div class="bolinha-cor" style="background: var(--cor-seguro);"></div>
          <div class="texto-legenda">
            <h5 style="color: var(--cor-seguro);">Nível Verde (Até 30%)</h5>
            <p><strong>Nível Seguro:</strong> Compromete menos de 30% da renda. Permite poupar ou investir.</p>
          </div>
        </div>

        <div class="item-legenda">
          <div class="bolinha-cor" style="background: var(--cor-atencao);"></div>
          <div class="texto-legenda">
            <h5 style="color: var(--cor-atencao);">Nível Amarelo (30% a 35%)</h5>
            <p><strong>Atenção:</strong> Cautela! Evite novas compras parceladas ou despesas secundárias.</p>
          </div>
        </div>

        <div class="item-legenda">
          <div class="bolinha-cor" style="background: var(--cor-perigo);"></div>
          <div class="texto-legenda">
            <h5 style="color: var(--cor-perigo);">Nível Laranja (35% a 40%)</h5>
            <p><strong>Risco Alto:</strong> Corte gastos não essenciais urgentemente.</p>
          </div>
        </div>

        <div class="item-legenda">
          <div class="bolinha-cor" style="background: var(--cor-alto);"></div>
          <div class="texto-legenda">
            <h5 style="color: var(--cor-alto);">Nível Vermelho (Acima de 40%)</h5>
            <p><strong>Superendividamento:</strong> Alerta máximo! Perigo de faltar recursos básicos.</p>
          </div>
        </div>

        <button class="btn-resetar-tudo" onclick="limparTudo()">
          <i class="fa-solid fa-rotate-left"></i> Apagar Tudo / Reiniciar App
        </button>
      </div>
    </div>

    <!-- MENU INFERIOR -->
    <div class="menu-inferior">
      <div class="item-menu ativo" onclick="mudarAba('aba-adicionar', this)">
        <i class="fa-solid fa-plus-circle"></i>
        <span>Lançar</span>
      </div>
      <div class="item-menu" onclick="mudarAba('aba-grafico', this)">
        <i class="fa-solid fa-chart-pie"></i>
        <span>Gráfico</span>
      </div>
      <div class="item-menu" onclick="mudarAba('aba-extrato', this)">
        <i class="fa-solid fa-clock-rotate-left"></i>
        <span>Extrato</span>
      </div>
      <div class="item-menu" onclick="mudarAba('aba-opcoes', this)">
        <i class="fa-solid fa-gear"></i>
        <span>Opções</span>
      </div>
    </div>

  </div>

  <script>
    let dados = [];
    try {
      dados = JSON.parse(localStorage.getItem('app_liceu_financeiro')) || [];
    } catch (e) {
      console.warn("localStorage inacessível, utilizando memória local.");
    }

    let tipoAtual = 'ganho';
    let meuGrafico = null;

    function trocarTipo(tipo) {
      tipoAtual = tipo;
      document.getElementById('btn-tipo-ganho').classList.toggle('ativo', tipo === 'ganho');
      document.getElementById('btn-tipo-gasto').classList.toggle('ativo', tipo === 'gasto');
      
      document.getElementById('campo-categoria').style.display = (tipo === 'ganho') ? 'none' : 'block';
    }

    function mudarAba(idAba, el) {
      document.querySelectorAll('.aba-conteudo').forEach(aba => aba.classList.remove('ativa'));
      document.querySelectorAll('.item-menu').forEach(item => item.classList.remove('ativo'));
      document.getElementById(idAba).classList.add('ativa');
      el.classList.add('ativo');

      if (idAba === 'aba-grafico') {
        renderizarGrafico();
      }
    }

    document.getElementById('form-movimentacao').addEventListener('submit', function(e) {
      e.preventDefault();
      const desc = document.getElementById('input-desc').value;
      const valor = parseFloat(document.getElementById('input-valor').value);
      const categoria = tipoAtual === 'gasto' ? document.getElementById('select-categoria').value : 'Renda/Ganho';

      dados.push({ id: Date.now(), desc, valor, tipo: tipoAtual, categoria });
      salvarEAtualizar();

      this.reset();
      trocarTipo('ganho');
    });

    function apagarItem(id) {
      if (confirm("Deseja apagar este registro especificamente?")) {
        dados = dados.filter(item => item.id !== id);
        salvarEAtualizar();
      }
    }

    function salvarEAtualizar() {
      try {
        localStorage.setItem('app_liceu_financeiro', JSON.stringify(dados));
      } catch (e) {}

      let ganhos = 0;
      let gastos = 0;
      const elExtrato = document.getElementById('lista-extrato');
      
      if (dados.length === 0) {
        elExtrato.innerHTML = `<p style="text-align: center; color: var(--cor-suave); font-size: 0.85rem;">Nenhum registro até o momento.</p>`;
      } else {
        elExtrato.innerHTML = '';
      }

      dados.slice().reverse().forEach(item => {
        if (item.tipo === 'ganho') ganhos += item.valor;
        else gastos += item.valor;

        elExtrato.innerHTML += `
          <div class="item-extrato">
            <div class="info">
              <h4>${item.desc}</h4>
              <span>${item.tipo === 'ganho' ? 'Renda' : item.categoria}</span>
            </div>
            <div class="lado-direito-item">
              <strong style="color: ${item.tipo === 'ganho' ? 'var(--cor-seguro)' : 'var(--cor-alto)'}">
                ${item.tipo === 'ganho' ? '+' : '-'} R$ ${item.valor.toFixed(2)}
              </strong>
              <i class="fa-solid fa-trash-can btn-deletar-item" title="Apagar entrada" onclick="apagarItem(${item.id})"></i>
            </div>
          </div>
        `;
      });

      document.getElementById('val-ganhos').innerText = `R$ ${ganhos.toFixed(2)}`;
      document.getElementById('val-gastos').innerText = `R$ ${gastos.toFixed(2)}`;
      document.getElementById('val-saldo').innerText = `R$ ${(ganhos - gastos).toFixed(2)}`;

      // Atualiza Metas 50/30/20
      document.getElementById('meta-50').innerText = `R$ ${(ganhos * 0.50).toFixed(2)}`;
      document.getElementById('meta-30').innerText = `R$ ${(ganhos * 0.30).toFixed(2)}`;
      document.getElementById('meta-20').innerText = `R$ ${(ganhos * 0.20).toFixed(2)}`;

      calcularSemafaroSerasa(ganhos, gastos);
    }

    function calcularSemafaroSerasa(ganhos, gastos) {
      const box = document.getElementById('box-status');
      const texto = document.getElementById('texto-semaforo');
      const icone = document.getElementById('icone-semaforo');

      if (ganhos <= 0) {
        texto.innerText = "Cadastre seus ganhos para ver a análise";
        box.style.background = "#64748b";
        icone.className = "fa-solid fa-circle-info";
        return;
      }

      const pct = (gastos / ganhos) * 100;

      if (pct <= 30) {
        texto.innerText = `Nível Verde: Seguro (${pct.toFixed(0)}% comprometido)`;
        box.style.background = "var(--cor-seguro)";
        icone.className = "fa-solid fa-circle-check";
      } else if (pct > 30 && pct <= 35) {
        texto.innerText = `Nível Amarelo: Atenção! (${pct.toFixed(0)}%)`;
        box.style.background = "var(--cor-atencao)";
        icone.className = "fa-solid fa-triangle-exclamation";
      } else if (pct > 35 && pct <= 40) {
        texto.innerText = `Nível Laranja: Perigo! (${pct.toFixed(0)}%)`;
        box.style.background = "var(--cor-perigo)";
        icone.className = "fa-solid fa-circle-exclamation";
      } else {
        texto.innerText = `Nível Vermelho: Superendividamento (${pct.toFixed(0)}%)`;
        box.style.background = "var(--cor-alto)";
        icone.className = "fa-solid fa-skull-crossbones";
      }
    }

    function renderizarGrafico() {
      const categorias = {
        'Alimentação': 0,
        'Vestuário': 0,
        'Transporte': 0,
        'Lazer': 0,
        'Outros': 0
      };

      dados.filter(d => d.tipo === 'gasto').forEach(item => {
        if (categorias[item.categoria] !== undefined) {
          categorias[item.categoria] += item.valor;
        } else {
          categorias['Outros'] += item.valor;
        }
      });

      const ctx = document.getElementById('graficoCategorias').getContext('2d');
      
      if (meuGrafico) {
        meuGrafico.destroy();
      }

      meuGrafico = new Chart(ctx, {
        type: 'doughnut',
        data: {
          labels: Object.keys(categorias),
          datasets: [{
            data: Object.values(categorias),
            backgroundColor: ['#ff6384', '#36a2eb', '#ffce56', '#4bc0c0', '#9966ff'],
            borderWidth: 2
          }]
        },
        options: {
          responsive: true,
          maintainAspectRatio: false,
          plugins: {
            legend: {
              position: 'bottom',
              labels: { font: { size: 11, weight: 'bold' } }
            }
          }
        }
      });
    }

    function limparTudo() {
      if (confirm("Deseja apagar todo o histórico e começar do zero?")) {
        dados = [];
        salvarEAtualizar();
        alert("Todos os dados foram excluídos com sucesso.");
      }
    }

    trocarTipo('ganho');
    salvarEAtualizar();
  </script>

</body>
</html>
