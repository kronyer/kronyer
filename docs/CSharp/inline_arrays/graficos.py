import pandas as pd
import matplotlib.pyplot as plt

data = {
    'Method': ['ArrayStackAlloc', 'UsoInlineArray', 'ArrayTradicionalHeap'],
    'Media (ns)': [303.4, 310.1, 465.8],
    'Erro (ns)': [6.06, 6.06, 9.28],
    'StdDev (ns)': [5.66, 7.66, 9.93],
    'Alocado (B)': [0, 0, 4024]
}
df = pd.DataFrame(data)

fig, (ax1, ax2) = plt.subplots(1, 2, figsize=(12, 5))
cores = ['#4CAF50', '#2196F3', '#F44336']

# Gráfico 1: Tempo com Margem de Erro
# O parâmetro yerr adiciona as "linhas" de erro, e capsize coloca os "tracinhos" na ponta
bars1 = ax1.bar(df['Method'], df['Media (ns)'], yerr=df['Erro (ns)'], capsize=7, color=cores, alpha=0.8, error_kw={'linewidth': 2})
ax1.set_title('Tempo Médio de Execução\n(Com Margem de Erro)')
ax1.set_ylabel('Nanosegundos (ns)')
ax1.tick_params(axis='x', rotation=15)

# Adicionando os textos dos valores (ajustado para não sobrepor a linha de erro)
for i, bar in enumerate(bars1):
    yval = bar.get_height()
    erro_val = df['Erro (ns)'][i]
    ax1.text(bar.get_x() + bar.get_width()/2, yval + erro_val + 5, f'{yval:.1f}', ha='center', va='bottom', fontweight='bold')

# Gráfico 2: Memória Alocada (continua igual, pois não tem variação)
bars2 = ax2.bar(df['Method'], df['Alocado (B)'], color=cores, alpha=0.8)
ax2.set_title('Memória Alocada na Heap\n(Lixo Gerado)')
ax2.set_ylabel('Bytes (B)')
ax2.tick_params(axis='x', rotation=15)

for bar in bars2:
    yval = bar.get_height()
    ax2.text(bar.get_x() + bar.get_width()/2, yval + 50, f'{int(yval)}', ha='center', va='bottom', fontweight='bold')

plt.tight_layout()
plt.savefig('benchmark_com_erros.png')