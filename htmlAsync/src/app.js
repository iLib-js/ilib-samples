    // all of the classes have been copied to the global scope here, so
    // you can just start using them:

import GregorianDate from 'ilib-es6/lib/GregorianDate';

import DateFmt from 'ilib-es6/lib/DateFmt';
import AddressFmt from 'ilib-es6/lib/AddressFmt';

DateFmt.create({locale:"ja-JP", length:"full"
}).then(fmt => {
   console.log("fmt: ", fmt);
    GregorianDate.create({
            year: 2011,
            month: 11,
            day: 20,
            hour: 13,
            minute: 45,
            second: 30
    }).then(result => { console.log("result:",fmt.format(result))});
});

console.log("END");
    
