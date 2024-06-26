import React, { useEffect, useState } from 'react';

function App() {
    const [message, setMessage] = useState('');

    useEffect(() => {
        fetch(`${process.env.REACT_APP_API_URL}/hello`)
        .then(response => response.json())
        .then(data => setMessage(data.message));
    }, []);

    return (
        <div className="App">
        <header className="App-header">
            <h1>{message}</h1>
        </header>
        </div>
    );
}

export default App;
