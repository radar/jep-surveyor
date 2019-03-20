

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
  questions: Question[]
}

class RatingQuestions extends React.Component<RatingQuestionsProps, {}> {
   state = {
     data: []
   }
  addQuestion = () => {
    this.fetchQuestions()
  }

  fetchQuestions = () => {
    axios.get('http://localhost:3000/rating_questions')
    .then((response) => 
      this.setState({ data: (response.data) })
    )
  }

  render() {
    return(
      <div>
        <h1>React+Rails</h1>
        <a href="/rating_questions/new">New Question</a>
        <Form addQuestion={this.addQuestion}/>
        <div className={styles.listOfQuestions} data-automation-id='questions-list'>
        {this.props.questions.map((question) => <RatingQuestion key={question.id} {...question}  />)}
        <a href="/rating_questions">all questions</a>
        </div>
      </div>
    )
  }
}

export default RatingQuestions