document.addEventListener('DOMContentLoaded', function() {
  window.addEventListener('resize', redrawChart);
  Timer.start(1573603200 * 1000);
});


function redrawChart() {
  const chart = Chartkick.charts['line-chart'];
  if (chart) chart.redraw();
}

class Timer {
  static start(end) {
    setInterval(function() {
      let now = Date.now();
      let remaining = end - now;

      if (remaining > 0) {
        let countdownData = Timer.convertTime(remaining);
        Timer.updateDOM(countdownData);
      }
    }, 1000)
  }

  static convertTime(ms) {
    const msPerDay = 1000 * 60 * 60 * 24;
    const msPerHour = 1000 * 60 * 60;
    const msPerMin = 1000 * 60;

    let days = Math.floor(ms / msPerDay);
    let hours = Math.floor((ms % msPerDay) / msPerHour);
    let mins = Math.floor((ms % msPerHour) / msPerMin);
    let secs = Math.floor((ms % msPerMin) / 1000);

    return [days, hours, mins, secs].map(val => {
      let str = val.toString();
      if (val.toString().length == 1) return '0' + str;
      return str;
    })
  }

  static updateDOM(countDownData) {
    let [days, hours, mins, secs] = countDownData;
    const el = document.getElementById('countdown');
    el.innerText = `${days}:${hours}:${mins}:${secs}`;
  }
}