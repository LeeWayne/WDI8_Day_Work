
// set variable to store total*
// set variable for last entry/input*
// select input, retrive value*
// keep track of running total*

// format the currency*
// update total (HTML)*
// updating entries (HTML)
// reset input

// namespacing
// constructor function
// private function

// console.log('j.s');

var total;

var CashRegister = function(){
  this.total = 0;
  this.latestEntry;
  this.totalElement = document.getElementById('total');
  this.inputElement = document.getElementById('newEntry');
  this.getNewEntry = function(){
    this.latestEntry = parseFloat(this.inputElement.value);
  }

  this.addToTotal = function(){
    this.total += this.latestEntry;
  }

  this.currencyFormat = function(unformattedTotal){
    return '£' + unformattedTotal.toFixed(2);
  }

  this.updateTotal = function(){
    this.totalElement.innerText = this.currencyFormat(this.total);
  }

  this.updateEntries = function(entry){
    var entryHTML = '<tr><td></td><td>';

        entryHTML += this.currencyFormat(entry);
        entryHTML += '</td></tr>';
        console.log(entryHTML);

        var entriesContainer = document.getElementById('entries');

        entriesContainer.innerHTML += entryHTML;
  }

}

  window.addEventListener('load',function(){

    var register = new CashRegister();
    console.log(register);

    var form = document.getElementById('entry');
    form.addEventListener('submit', function(event){
      event.preventDefault();
      // console.log('total before', register.total);
      register.getNewEntry();
      // console.log(register.latestEntry);
      register.addToTotal();
      // console.log('total after', register.total);
      register.updateTotal();
      register.updateEntries(register.latestEntry);
    });

  });












