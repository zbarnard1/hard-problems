import React, { Component } from "react";
import "./App.css";

class App extends Component {
  constructor() {
    super();
    this.state = {
      results: []
    };
  }

  tryApi = () => {
    fetch
  }

  hardCodedSearch = () => {
    this.setState(currentState => {
      currentState.results.push({ title: "Title", snippet: "Snippet", key: (currentState.results.length + 1)});
      return { results: currentState.results };
    });
  };

  newResult = (result) => {
    return (
      <div key={result.key}>
        <h3>{result.title}</h3>
        <p>{result.snippet}</p>
      </div>
    )
  };

  clearState = () => {
    this.setState({results: []});
  }

  render() {
    return (
      <div className="App">
        <h1>Hard Problems</h1>
        <button onClick={this.hardCodedSearch}>Search</button>
        <button onClick={this.clearState}>Clear</button>
        {this.state.results.map(result => this.newResult(result))}
      </div>
    );
  }
}

export default App;