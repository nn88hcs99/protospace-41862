class CreatePrototypes < ActiveRecord::Migration[7.1]
  def change
    create_table   :prototypes do |t|
      t.string     :title,              null: false, default: ""  # プロトタイプ名称（必須）
      t.text       :catch_copy,         null: false # キャッチコピー（必須）
      t.text       :concept,            null: false # コンセプト（必須）
      t.references :user,               null: false, foreign_key: true  # 外部キー制約あり
      
      
      t.timestamps
    end
  end
end
