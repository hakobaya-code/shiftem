
document.addEventListener("DOMContentLoaded", function() {
    function displayTime() {
        const padZero = value => value.toString().padStart(2, '0');
      
        const now = new Date();
        const hour = padZero(now.getHours());
        const minute = padZero(now.getMinutes());
        const second = padZero(now.getSeconds());
      
        const currentTime = `${hour}:${minute}:${second}`;
        document.querySelector('.clock').textContent = currentTime; 
    }
  
    displayTime();
    setInterval(displayTime, 1000);
});
