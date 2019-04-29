
import * as React from 'react'
import axios from 'axios'
import * as styles from './index.module.scss'
import RatingQuestion from './RatingQuestion'
import Form from './Form';

interface Question {
  id: string,
  title: string,
  url: string
}

interface RatingQuestionsProps {
  questions: Question[],
  url: string
}

class RatingQuestions extends React.Component<RatingQuestionsProps, {}> {
  state = {
    questions: this.props.questions
  }

  handleDelete= (e) => {
    e.preventDefault();
    console.log("delete!")
    let url = this.state.questions["url"]
    axios.delete()
    .then((result) => {
        console.log(result.data)
        this.setState(questions = result.data)
        // this.props.questions = result.question
    })
    }
  }

  addQuestion = (question) => {
    let questions = this.state.questions
    questions.push(question)
    this.setState({questions})
  }

  render() {
    console.log(this.state.questions)
    return(
      <div className={styles.list} data-automation-id='questions-list'>
        {this.state.questions.map((question) => 
              <a href={question.rating_question_url}>
                <RatingQuestion key={question.id} {...question} />
                  <a className="btn btn-danger btn-xs"
                    onClick={this.handleDelete} >
                    Delete
                  </a>
                </a>,
          )}
      <Form rating_question_url="/rating_questions.json" addQuestion={this.addQuestion}/>
      </div>

    )
  }
}

export default RatingQuestions
