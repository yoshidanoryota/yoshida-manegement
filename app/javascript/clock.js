(()=>{
  const zero = n => (n < 10 ) ? "0" + n.toString() : n.toString();



  const youbi = ["日","月","火","水","木","金","土"];
  const getDateString = date =>
      `${ date.getFullYear() }/${ zero(date.getMonth() + 1) }/${ zero(date.getDate()) }/(${ youbi[date.getDay()] })`;



  const getHourString = date =>
      `${ zero(date.getHours()) }: ${ zero(date.getMinutes()) }: ${ zero(date.getSeconds()) }`;




  window.addEventListener('DOMContentLoaded',()=> {
      
      const dateDiv = document.getElementById("date");
      const clockDiv = document.getElementById("clock");



      
      let nowDate = null;



      
      setInterval( ()=>{
          
          const now = new Date();
    
          if( nowDate !== now.getDate() ) {
              nowDate = now.getDate();
              dateDiv.innerText = getDateString(now);
          }



          
          clockDiv.innerText = getHourString(now);
      },1000);
  });
})();


