window.addEventListener('resize', redrawChart);

function redrawChart() {
  const chart = Chartkick.charts['line-chart'];
  if (chart) chart.redraw();
}