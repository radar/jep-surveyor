

import * as React from 'react'
import axios from 'axios'
import * as styles from './index.module.scss'
import RatingQuestion from './RatingQuestion'

interface Question {
  id: string,
  title: string,
  url: string
}

interface RatingQuestionsProps {
  questions: Question[]
}

class RatingQuestions extends React.Component<RatingQuestionsProps, {}> {
  

  render() {
    return(
      <div>
        <h1>React+Rails</h1>
        {/* <a href="/rating_questions/new">New question</a> */}
        <div className={styles.listOfQuestions} data-automation-id='questions-list'>
        <a href=""></a>
        {this.props.questions.map((question) => <RatingQuestion key={question.id} {...question}  />)}
        <a href="/rating_questions">all questions</a>
        </div>
      </div>
    )
  }
}

export default RatingQuestions