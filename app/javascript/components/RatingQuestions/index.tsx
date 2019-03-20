
import * as React from 'react'
import axios from 'axios'
import * as styles from './index.module.scss'
import RatingQuestion from './RatingQuestion'


interface Question {
  id: string,
  title: string,
  rating_question_url: string
}

interface RatingQuestionsProps {
  questions: Question[]
  // rating_question_url: string
}

class RatingQuestions extends React.Component<RatingQuestionsProps, {}> {

  render() {
    return(
      <div className={styles.list} data-automation-id='questions-list'>
        {this.props.questions.map((question) => 
              <a href={question.rating_question_url}>
                <RatingQuestion key={question.id} {...question} /></a>
          )}
      <a href="rating_questions/new">create a new question</a>
      </div>

    )
  }
}

export default RatingQuestions
