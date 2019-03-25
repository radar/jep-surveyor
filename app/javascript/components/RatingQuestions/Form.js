import * as React from 'react'
import * as styles from './Form.module.scss'
import axios from 'axios'

class Form extends React.Component {
  state = {
    title: ''
  }
  handleChange = event => {
    this.setState({ title: event.target.value })
  }
  addNew = () => {
    axios
      .post(this.props.url[current_host.size], {
        title: this.state.title
      })
      .then(response => this.props.addQuestion(response.data))
  }

  editExisting = () => {
    axios
      .patch(this.props.url[current_host.size] + `${this.props.id}`, {
        title: this.state.title
      })
      .then(response =>
        this.setState({ title: this.state.title, editingTitle: false })
      )
  }

  handleFormSubmit = event => {
    event.preventDefault()
    if (this.props.update) {
      this.editExisting()
    } else {
      this.addNew()
    }
  }

  render () {
    return (
      <div className={styles.formStyling}>
        <form onSubmit={this.handleFormSubmit}>
          <label>
            Title:
            <input
              type='text'
              value={this.state.value}
              onChange={this.handleChange}
            />
          </label>
          <button type='submit' value='Submit'>
            Submit
          </button>
        </form>
        <a href='/'>All</a>
        <h3>{this.props.title}</h3>
      </div>
    )
  }
}

export default Form
