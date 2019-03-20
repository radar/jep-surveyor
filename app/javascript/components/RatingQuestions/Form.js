import * as React from 'react'
import * as styles from './Form.module.scss'
import axios from 'axios'

class Form extends React.Component {
  state = {
    value: ""
  }
  handleChange = (event) => {
    this.setState({value: event.target.value});
  }

  handleFormSubmit = (event) => {
    event.preventDefault();
    axios.post("http://localhost:3000/rating_questions", {
      title: this.state.value,
    })
      .then( (response) => this.props.addQuestion())
      this.setState({
        value: ""
    })
  } 


  

  render() {
    return(
      <div className={styles.formStyling}>
        <form onSubmit={this.handleFormSubmit}>
          <label>
            Title:
            <input type="text" value={this.state.value} onChange={this.handleChange} />
          </label>
          <input type="submit" value="Submit" />
        </form>
        <a href="/">All</a>
      </div>
    )
  }
}

export default Form